# changelog

## 0.2.0 — session 2

### added

- **hooks runtime** (`scripts/hooks/`) — three claude code hooks ship working:
  - `pre-write.js` (PreToolUse) scans content for banned ai-tone, corporate filler, hollow openers, and rhythm flatness against the rules in `rules/brand/banned-words.md` and `rules/copy/anti-ai-tone.md`. non-blocking by default; set `STUDIO_HOOK_STRICT=1` to block.
  - `post-write.js` (PostToolUse) logs every write to `~/.claude/studio/logs/session-YYYY-MM-DD.log`.
  - `prompt-context.js` (UserPromptSubmit) inspects the user prompt for ~40 keywords (prd, design review, brand voice, a11y, jtbd, etc.) and surfaces the matching skill/rule files as additional context. also includes `memory/instincts.md` automatically when edited.
- **cross-harness adapters** under `adapters/` for cursor, openai codex cli, opencode, gemini cli, zed, and vscode/copilot. each has an install script and README explaining what's supported per harness.
- **20 new commands** to bring total to 26: `spec`, `research-synth`, `jtbd`, `roadmap`, `scope`, `metrics`, `experiment`, `competitor`, `launch`, `voice-extract`, `tagline`, `position`, `messaging`, `value-prop`, `microcopy`, `landing`, `case-study`, `release`, `system-audit`, `handoff`.
- **mcp configs** filled in with real references: figma (remote + dev mode), notion, linear (remote), posthog, filesystem. paired with a README that documents required env vars and source URLs.
- **memory directory** (`memory/`) for `instincts.md`, `lessons.md`, `glossary.md`, `decisions/`, `templates/`. memory is where operator-specific learnings live, outside the source-of-truth files.
- **tests directory** (`tests/run-all.js`) — comprehensive validator covering JSON parsing, frontmatter validity, hook script execution, adapter install scripts, cross-references between hooks and skills/rules, and unit tests for the checks library.

### fixed

- `hooks/hooks.json` was a placeholder in s1; now a real template with `${STUDIO_ROOT}` substitution.
- `mcp-configs/mcp-servers.json` was a placeholder in s1; now references real mcp servers (figma, notion, linear, posthog, filesystem) with env var templates.

### bugs caught and fixed during s2 build

- `prompt-context.js` used `import.meta.url` which forced node 22 into ESM mode and crashed on `require`. fixed by removing the import.meta path and using `__dirname` directly.
- ai-tone pattern list was missing -ed inflections (`leveraged`, `elevated`, `empowered`, `fostered`, etc.). caught by smoke test; expanded patterns.js to cover them.

### tested

- 314 tests pass (json parsing, frontmatter validity, hook execution including edge cases, adapter install scripts, cross-references, unit tests for checks library)
- all 6 adapter install scripts verified clean on a sandbox `HOME`
- pre-write hook verified on 8 edge cases (clean, empty, malformed, binary, rules-file, code, rhythm, strict-mode)

### scope honesty

s2 ships the hooks and adapters. it does not include a dashboard, no docs site, no v0 of the npm package as a runnable cli. those are session 3 / 4 work.

---

## 0.1.0 — session 1

### added

- claude code plugin scaffold: `.claude-plugin/plugin.json` + marketplace manifest
- 15 specialist agents across design, product, brand
- 30 skills (10 per lane) with structured workflows
- 6 commands: `design-review`, `prd`, `brand-check`, `name`, `copy-review`, `a11y-scan`
- 23 rules across common, design, product, brand, copy
- `install.sh` and `install.ps1` for unix and windows
- `README.md`, `STUDIO.md` (operator handbook), `SOUL.md` (founding principles), `DISCLAIMER.md`
- MIT license
- placeholder `hooks/hooks.json` and `mcp-configs/mcp-servers.json` (real versions in 0.2.0)

---

## planned

### 0.3.0 — session 3

- dashboard ui (browse skills, agents, commands, rules visually)
- skill activation log (which skill ran, when, on what)
- drift guards (changes to rules emit warnings when they affect downstream skills)
- expanded skill set: brand identity audit, content calendar, email sequence

### 0.4.0 — session 4

- docs site (github pages)
- public launch
- contribution guide
- skill authoring template

### 0.5.0 — session 5

- npm package as runnable cli (`npx studio <command>`)
- github app for repo-level integration (if there's traction)
