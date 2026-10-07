#!/usr/bin/env python3
"""Flatten a Claude Code session transcript (.jsonl) into readable Markdown.

Usage:
  extract_session.py <session.jsonl> [--thinking] [--result-chars N] [--no-follow]
  extract_session.py --list <project-dir> [--limit N]

Follows `continued-in` records to the next session file in the same directory,
skips harness noise (attachments, mode, cost state) and subagent sidechains,
and truncates tool results so the output stays readable. Standard library only.
"""

import argparse
import json
import re
import sys
from pathlib import Path

NOISE_TAGS = re.compile(
    r"<(system-reminder|command-message|local-command-stdout|local-command-caveat)>.*?</\1>",
    re.S,
)
# A slash command stores the typed prompt in <command-args>; keep it as "/name args".
COMMAND = re.compile(r"<command-name>(.*?)</command-name>\s*(?:<command-args>(.*?)</command-args>)?", re.S)
BARE_COMMANDS = {"/clear", "/compact", "/exit", "/resume"}


def clean(text):
    text = NOISE_TAGS.sub("", text)
    text = COMMAND.sub(lambda m: f"{m.group(1)} {m.group(2) or ''}".strip(), text).strip()
    return "" if text in BARE_COMMANDS else text


def one_line(text, limit):
    text = " ".join(str(text).split())
    return text if len(text) <= limit else text[: limit - 3] + "..."


def tool_call(block):
    inp = block.get("input") or {}
    detail = inp.get("description") or inp.get("command") or inp.get("file_path") or inp.get("pattern") or inp.get("prompt") or ""
    return f"`{block.get('name')}`: {one_line(detail, 160)}" if detail else f"`{block.get('name')}`"


def tool_result(block, limit):
    content = block.get("content")
    if isinstance(content, list):
        content = "\n".join(c.get("text", "") for c in content if isinstance(c, dict))
    content = clean(str(content or ""))
    if not content:
        return None
    if len(content) > limit:
        content = content[:limit] + f"\n... [{len(content) - limit} chars cut]"
    label = "error" if block.get("is_error") else "result"
    return f"<details><summary>{label}</summary>\n\n```\n{content}\n```\n</details>"


def render(path, args, out):
    title, next_id = None, None
    for line in path.open(encoding="utf-8"):
        try:
            rec = json.loads(line)
        except json.JSONDecodeError:
            continue
        kind = rec.get("type")
        if kind == "ai-title":
            title = rec.get("aiTitle")
        elif kind == "continued-in":
            next_id = rec.get("continuedInSessionId")
        if kind not in ("user", "assistant") or rec.get("isSidechain") or rec.get("isMeta"):
            continue
        content = rec.get("message", {}).get("content")
        stamp = (rec.get("timestamp") or "")[:16].replace("T", " ")
        if isinstance(content, str):
            content = [{"type": "text", "text": content}]
        parts = []
        for block in content or []:
            btype = block.get("type")
            if btype == "text" and clean(block.get("text", "")):
                parts.append(clean(block["text"]))
            elif btype == "thinking" and args.thinking and block.get("thinking"):
                parts.append("> (thinking) " + one_line(block["thinking"], 1200))
            elif btype == "tool_use":
                parts.append("- call " + tool_call(block))
            elif btype == "tool_result":
                rendered = tool_result(block, args.result_chars)
                if rendered:
                    parts.append(rendered)
        if not parts:
            continue
        # A user record holding only tool results is the harness talking, not the person.
        if kind == "user" and any(b.get("type") == "text" for b in content):
            out.append(f"\n## USER  ({stamp})\n")
        elif kind == "assistant":
            out.append(f"\n### assistant  ({stamp})\n")
        out.append("\n\n".join(parts))
    return title, next_id


def list_sessions(project_dir, limit):
    files = sorted(Path(project_dir).glob("*.jsonl"), key=lambda p: p.stat().st_mtime, reverse=True)
    for f in files[:limit]:
        title, first = None, None
        for line in f.open(encoding="utf-8"):
            try:
                rec = json.loads(line)
            except json.JSONDecodeError:
                continue
            if rec.get("type") == "ai-title":
                title = rec.get("aiTitle")
            elif rec.get("type") == "last-prompt" and not first:
                first = rec.get("lastPrompt")
        print(f"{f.stem}  {title or '-'}  |  {one_line(first or '', 90)}")


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("session", nargs="?")
    ap.add_argument("--list", metavar="PROJECT_DIR")
    ap.add_argument("--limit", type=int, default=20)
    ap.add_argument("--thinking", action="store_true", help="include assistant thinking (often holds the wrong turns)")
    ap.add_argument("--result-chars", type=int, default=600)
    ap.add_argument("--no-follow", action="store_true", help="do not follow continued-in to later sessions")
    args = ap.parse_args()

    if args.list:
        list_sessions(args.list, args.limit)
        return
    if not args.session:
        ap.error("session path or --list is required")

    path, out, seen = Path(args.session), [], set()
    while path and path.exists() and path.stem not in seen:
        seen.add(path.stem)
        header = len(out)
        out.append(f"\n# Session {path.stem}\n")
        title, next_id = render(path, args, out)
        if title:
            out.insert(header + 1, f"Title: {title}\n")
        path = None if args.no_follow or not next_id else Path(args.session).parent / f"{next_id}.jsonl"
    sys.stdout.write("\n".join(out) + "\n")


if __name__ == "__main__":
    main()
