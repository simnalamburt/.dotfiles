---
name: commit
description: Create commit messages from diff using repo style
---

# Commit

## Workflow

1. Inspect repository state and choose the commit source.
```bash
git status --short
git diff --cached --name-only
```
- If staged files exist, commit staged changes only.
- If nothing is staged but working tree has changes, stage all with `git add -A`
  before composing the commit.
- If no changes exist, stop and report nothing to commit.

2. Read changed files and summarize intent.
```bash
git diff --cached --stat
git diff --cached
```
Use `git diff` when the commit source is the working tree.
Extract the primary change theme in one sentence.

3. Infer subject convention from recent history.
```bash
git log --no-merges --format=%s -n 40
git log --no-merges --format=%s -- <path-or-scope> -n 20
```
Apply these rules:
- Use the common parent directory of changed files, or the representative module
  for the change, as `<path-or-scope>`.
- Prefer `<scope>: <Subject>` when recent related commits use it.
- Use imperative, concise subject text.
- Match casing and punctuation style used in nearby commits.

4. Validate before commit.
If this git repository has CI, run the appropriate local checks before
committing to verify there are no problems.
- Inspect the repository's CI configuration first and follow the closest
  matching validation steps.
- Prefer the narrowest commands that faithfully reflect CI for the files being
  committed.
- If no CI is defined, skip this step and note that no CI-based validation was
  available.
- If checks fail, stop and report failure unless the user explicitly asks to
  commit anyway.

5. Draft commit message.
Format:
```text
<TITLE>

<BODY>

Co-authored-by: @codex <199175422+chatgpt-codex-connector[bot]@users.noreply.github.com>
```
Message rules:
- Keep title on one line and under 72 chars when possible.
- Wrap body lines at 72 chars
- You are free to use multiple paragraphs in the body, and to use blank lines to
  separate them, but avoid unnecessary verbosity.
- You are free to use bullet points in the body if it helps readability, but
  avoid unnecessary verbosity.
- You are free to list references at the end of the commit message body if
  relevant.
- Avoid generic body text such as "update" or "fix stuff".

Example:
```text
rtnetlink: add missing netlink_ns_capable() check for peer netns

rtnl_newlink() lacks a CAP_NET_ADMIN capability check on the peer
network namespace when creating paired devices (veth, vxcan, netkit).
This allows an unprivileged user with a user namespace to create
interfaces in arbitrary network namespaces, including init_net.

- Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do
  eiusmod tempor incididunt ut labore et dolore magna aliqua.
- Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris
  nisi ut aliquip ex ea commodo consequat.
- Duis aute irure dolor in reprehenderit in voluptate velit esse cillum
  dolore eu fugiat nulla pariatur.

Add a netlink_ns_capable() check for CAP_NET_ADMIN in the peer
namespace before allowing device creation to proceed.

Example:

    $ command arg0 arg1
    blabla

    $ command arg3 arg4
    blablabla

References:
  https://example.com/blabla
  https://hyeon.me

Co-authored-by: @codex <199175422+chatgpt-codex-connector[bot]@users.noreply.github.com>
```

6. Create the commit.
```bash
git commit -F - <<'EOF'
<TITLE>

<BODY>

Co-authored-by: @codex <199175422+chatgpt-codex-connector[bot]@users.noreply.github.com>
EOF
```

## Output Contract

When invoked, always provide:
1. Proposed title
2. Proposed body
3. Validation status (`ran`, `skipped`, or `failed`) with the command summary
4. Final commit command or resulting commit hash
