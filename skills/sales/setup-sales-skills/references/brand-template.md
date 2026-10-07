---
version: 1
updated: <yyyy-mm-dd>
---

# Brand (CI)

Tokens for client-facing documents. `sales-document` reads the token block mechanically, so keep its keys. Freelancers with no CI: keep the neutral defaults and set `logo` to a wordmark or leave `[not captured]` (the cover then shows the display name as text).

```yaml
primary: "#1f3a5f"      # headings, table headers, cover rule
secondary: "#4a6fa5"    # sub-headings, links
accent: "#e0a526"       # section underline, callouts; keep sparingly
text: "#1d1d1f"
muted: "#6b6b70"
font_body: "IBM Plex Sans Thai"     # must cover the document language's script
font_heading: "IBM Plex Sans Thai"  # at most two families
font_url: "https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+Thai:wght@400;600;700&display=swap"
logo: "brand/logo.svg"              # light background
logo_dark: "[not captured]"
```

## Rules

- Body text and table headers keep WCAG AA contrast (4.5:1) against their backgrounds; check `primary` against white.
- Logo is never stretched, recolored, or placed on a busy background.
- Co-branding: when a client logo exists in `clients/<client>/`, the cover shows it at the same height as ours.

## Voice

- 3-5 adjectives: <e.g. direct, warm, precise>
- Words to use / avoid: <optional>
