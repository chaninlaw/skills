#!/usr/bin/env node
// Render a sales Markdown document into the workspace's branded HTML template.
// Usage: node render.mjs <document-template.html> <source.md> <out.html>
// Zero dependencies. Handles the Markdown subset sales documents use: headings, paragraphs,
// bullet and numbered lists, GFM tables, blockquotes, bold/italic/code/links, raw HTML blocks.
// Per-document slots come from the source's YAML frontmatter (flat `key: value` lines):
//   title, subtitle, doc_no, date, valid_until, client_name, footer_note, client_logo (optional path)
// Exits non-zero, listing the slots, when any {{slot}} would survive into the output.
import fs from 'node:fs';

const [tplPath, srcPath, outPath] = process.argv.slice(2);
if (!tplPath || !srcPath || !outPath) {
  console.error('usage: node render.mjs <document-template.html> <source.md> <out.html>');
  process.exit(2);
}

const esc = (s) => s.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;');
const attr = (s) => esc(s).replace(/"/g, '&quot;');

let md = fs.readFileSync(srcPath, 'utf8').replace(/\r\n/g, '\n');
const fm = {};
md = md.replace(/^---\n([\s\S]*?)\n---\n/, (_, block) => {
  for (const line of block.split('\n')) {
    const m = line.match(/^([A-Za-z_]+):\s*(.*)$/);
    if (m) fm[m[1]] = m[2].replace(/^["']|["']$/g, '').trim();
  }
  return '';
});
md = md.replace(/^\s*# .*\n/, ''); // the cover carries the title

const inline = (s) =>
  esc(s)
    .replace(/`([^`]+)`/g, '<code>$1</code>')
    .replace(/\*\*(.+?)\*\*/g, '<strong>$1</strong>')
    .replace(/(^|[^*])\*([^*\s][^*]*)\*/g, '$1<em>$2</em>')
    .replace(/\[([^\]]+)\]\(([^)\s]+)\)/g, '<a href="$2">$1</a>');

// A number column holds amounts or quantities: every non-empty body cell is numeric-looking.
// Ordinals ("1", "2" in a # column) count too and stay right-aligned, which reads fine.
const plain = (c) => c.replace(/\*\*/g, '').trim();
const numeric = (c) => /\d/.test(c) && /^[-+()\d.,\s%฿$€£×x/–—]*$/i.test(plain(c).replace(/\b(THB|USD|EUR|บาท)\b/g, ''));
const cells = (row) => row.trim().replace(/^\||\|$/g, '').split('|').map((c) => c.trim());

function table(rows) {
  const head = cells(rows[0]);
  const body = rows.slice(2).map(cells);
  const isNum = head.map((_, i) => {
    const col = body.map((r) => r[i] ?? '').filter((c) => plain(c));
    return col.length > 0 && col.every(numeric);
  });
  const cls = (i) => (isNum[i] ? ' class="num"' : '');
  let html = '<table><thead><tr>' + head.map((h, i) => `<th${cls(i)}>${inline(h)}</th>`).join('') + '</tr></thead><tbody>';
  for (const r of body) {
    const total = /^\*\*.+\*\*$/.test(r[0] ?? '');
    html += `<tr${total ? ' class="total"' : ''}>` + r.map((c, i) => `<td${cls(i)}>${inline(c.replace(/^\*\*(.*)\*\*$/, '$1'))}</td>`).join('') + '</tr>';
  }
  return html + '</tbody></table>';
}

const lines = md.split('\n');
const out = [];
for (let i = 0; i < lines.length; ) {
  const l = lines[i];
  if (!l.trim()) { i++; continue; }
  if (/^\s*\|/.test(l)) {
    const rows = [];
    while (i < lines.length && /^\s*\|/.test(lines[i])) rows.push(lines[i++]);
    out.push(table(rows));
    continue;
  }
  const h = l.match(/^(#{2,4})\s+(.*)$/);
  if (h) { out.push(`<h${h[1].length}>${inline(h[2])}</h${h[1].length}>`); i++; continue; }
  if (/^\s*[-*]\s+/.test(l) || /^\s*\d+[.)]\s+/.test(l)) {
    const ordered = /^\s*\d+[.)]\s+/.test(l);
    const re = ordered ? /^\s*\d+[.)]\s+/ : /^\s*[-*]\s+/;
    const items = [];
    while (i < lines.length && re.test(lines[i])) items.push(`<li>${inline(lines[i++].replace(re, ''))}</li>`);
    out.push(ordered ? `<ol>${items.join('')}</ol>` : `<ul>${items.join('')}</ul>`);
    continue;
  }
  if (/^>\s?/.test(l)) {
    const q = [];
    while (i < lines.length && /^>\s?/.test(lines[i])) q.push(inline(lines[i++].replace(/^>\s?/, '')));
    out.push(`<blockquote>${q.join('<br>')}</blockquote>`);
    continue;
  }
  if (/^\s*</.test(l)) { // raw HTML block (e.g. <div class="signatures">) passes through until a blank line
    const b = [];
    while (i < lines.length && lines[i].trim()) b.push(lines[i++]);
    out.push(b.join('\n'));
    continue;
  }
  const p = [];
  while (i < lines.length && lines[i].trim() && !/^(\s*\||#{2,4}\s|\s*[-*]\s|\s*\d+[.)]\s|>|\s*<)/.test(lines[i])) p.push(inline(lines[i++]));
  out.push(`<p>${p.join('<br>')}</p>`);
}

const slots = {
  doc_title: fm.title,
  doc_subtitle: fm.subtitle ?? '',
  doc_no: fm.doc_no,
  doc_date: fm.date,
  valid_until: fm.valid_until ?? '-',
  client_name: fm.client_name,
  footer_note: fm.footer_note ?? '',
  client_logo_html: fm.client_logo ? `<img src="${attr(fm.client_logo)}" alt="${attr(fm.client_name ?? '')}">` : '',
  content: out.join('\n'),
};

let html = fs.readFileSync(tplPath, 'utf8').replace(/\{\{(\w+)\}\}/g, (m, k) => (slots[k] !== undefined ? (k.endsWith('_html') || k === 'content' ? slots[k] : esc(slots[k])) : m));
const left = [...new Set(html.match(/\{\{\w+\}\}/g) ?? [])];
if (left.length) {
  console.error(`unfilled slots: ${left.join(', ')} (frontmatter keys, or setup-time slots in the template)`);
  process.exit(1);
}
fs.writeFileSync(outPath, html);
console.log(`wrote ${outPath}`);
