---
version: 1
updated: <yyyy-mm-dd>
---

# Document storage

Where client-facing documents live and how an agent reaches them. Read by `sales-document` before it delivers a file and by `sales-research` when it opens a client. Edit freely; re-run `/setup-sales-skills` to switch targets.

## Working copy (always local)

Markdown sources, internal files and drafts live only in this workspace (`docs/sales/`). The deal's `sent/` folder keeps a local copy of every delivered version, whatever the target below.

## Delivery

- Target: local | google-drive | other
- Format the client receives: pdf | pdf + docx
- Folder layout at the target: `<client>/<deal>/`

### local

- Root: <absolute path outside any client-visible repo, e.g. ~/Documents/Clients>
- Deliver: copy the file from `sent/` to `<root>/<client>/<deal>/`.

### google-drive

- Tool: `gws` (Google Workspace CLI). Account: <email>
- Check access: `gws drive about get --params '{"fields":"user(emailAddress)"}'` prints the account. A 401 or `invalid_grant` means the login expired: the user runs `gws auth login` (an agent cannot complete the browser step).
- Root folder: <name>, id `<folder id>`
- Create a folder: `gws drive files create --json '{"name":"<name>","mimeType":"application/vnd.google-apps.folder","parents":["<parent id>"]}'`; record its id in the index below.
- Upload: `gws drive +upload <file> --parent <deal folder id>`; record the returned file id and link in `deal.md`.
- Sharing and permissions are the user's job: the agent never shares, moves, renames or deletes anything in Drive.

### other

- Platform, location, tool, access check, upload command: <describe in a few lines>

## Folder index

| Client / deal | Location (path or folder id) | Created |
|---|---|---|
