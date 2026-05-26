# STUDIO

harness-native operator system for design, product and brand work.

agents, skills, hooks, rules and commands for ai coding agents like claude code, cursor, codex, opencode, gemini cli, zed, and vscode + copilot. one source of truth in markdown, six adapters for the rest. MIT licensed, free for everyone, designed to be edited freely.

```
studio/
├── agents/         15 specialist agents
├── skills/         30 skills across design, product, brand
├── commands/       26 slash commands
├── rules/          23 rules across 5 lanes
├── hooks/          working claude code hooks (pre-write, post-write, prompt-context)
├── mcp-configs/    figma, notion, linear, posthog, filesystem
├── memory/         operator instincts, lessons, decisions, glossary
├── adapters/       cursor, codex, opencode, gemini, zed, vscode
├── scripts/hooks/  hook runtime (node, executable)
└── tests/          run-all.js validator
```

## quick install (claude code)

```bash
git clone https://github.com/Dragoon0x/studio.git ~/.claude/studio
cd ~/.claude/studio
./install.sh
```

the installer registers the plugin, writes the hooks config into `~/.claude/settings.json` with absolute paths, and installs the mcp templates.

## what's in here

### agents (15)

design-reviewer, design-system-auditor, accessibility-reviewer, brand-voice-keeper, copywriter, microcopy-writer, product-strategist, ux-research-synthesizer, competitor-analyst, naming-generator, narrative-architect, taxonomy-architect, release-narrator, case-study-writer, pitch-deck-writer.

### skills (30)

**design (10)**: design-review, design-system-audit, accessibility-audit, figma-handoff-spec, component-spec, motion-direction, responsive-rules, dark-mode-pairing, iconography-system, data-viz-design.

**product (10)**: prd-writing, spec-writing, research-synthesis, jtbd-framing, roadmap-planning, feature-scoping, metric-design, ab-test-design, competitive-analysis, launch-planning.

**brand (10)**: brand-voice-extraction, naming-generation, tagline-writing, positioning-statement, messaging-architecture, value-prop-writing, microcopy-writing, landing-copy, case-study-writing, release-narrative.

### commands (26)

design: `/design-review`, `/a11y-scan`, `/system-audit`, `/handoff`
product: `/prd`, `/spec`, `/research-synth`, `/jtbd`, `/roadmap`, `/scope`, `/metrics`, `/experiment`, `/competitor`, `/launch`
brand: `/brand-check`, `/name`, `/copy-review`, `/voice-extract`, `/tagline`, `/position`, `/messaging`, `/value-prop`, `/microcopy`, `/landing`, `/case-study`, `/release`

### hooks (3)

`pre-write` flags ai-tone and rhythm flatness before writes. `post-write` logs every write. `prompt-context` surfaces relevant skills based on prompt keywords. all non-blocking by default. set `STUDIO_HOOK_STRICT=1` to block on flags.

### rules (23)

- common (5): principles, process, handoff, research, decisions
- design (5): spacing, type, color, motion, accessibility
- product (5): prd-structure, jtbd, metrics, specs, research-standards
- brand (5): voice, tone-matrix, banned-words, naming-conventions, messaging-hierarchy
- copy (3): sentence-rhythm, anti-ai-tone, active-voice

### adapters (6)

cursor (.mdc rules), codex (AGENTS.md), opencode (commands + agents + opencode.json), gemini cli (GEMINI.md + @-imports), zed (agent profile), vscode + github copilot (.github/copilot-instructions.md).

each adapter has its own `install.sh`. run from STUDIO root:

```bash
./adapters/cursor/install.sh           # user-scope
./adapters/cursor/install.sh --project # project-scope
```

### memory

`memory/instincts.md`, `lessons.md`, `glossary.md`, `decisions/`, `templates/`. edit these as you learn what works for your team. instincts get auto-loaded by the prompt-context hook once edited.

### mcp servers

figma (remote + dev mode stdio), notion, linear (remote), posthog, filesystem. see `mcp-configs/README.md` for env vars and setup.

## install options

```bash
./install.sh                        # default: claude code, all rules
./install.sh --rules common,design  # only common and design rules
./install.sh --target claude        # claude code (default)
./install.sh --no-hooks             # skip hooks setup
./install.sh --with-adapters cursor # also install cursor adapter
```

windows:

```powershell
.\install.ps1 -Rules "common,design"
```

## tests

```bash
node tests/run-all.js
```

validates: JSON parsing, agent/skill/command frontmatter, hook execution on 8 edge cases, adapter install scripts, cross-references, and unit tests on the banned-word and rhythm checkers.

## license

MIT. see LICENSE.

## disclaimer

see DISCLAIMER.md. opinions in agents and skills are starting points; override them when context demands it. content generated through STUDIO is the responsibility of the operator running the harness.

## author

[Dragoon0x](https://github.com/Dragoon0x) — [0xdragoon.xyz](https://0xdragoon.xyz/). issues and PRs welcome at [github.com/Dragoon0x/studio](https://github.com/Dragoon0x/studio).

## contributors

- [Dragoon0x](https://github.com/Dragoon0x) — creator, maintainer.

full contributor list lives on the GitHub [contributors page](https://github.com/Dragoon0x/studio/graphs/contributors).

---

## status: experimental — DYOR

STUDIO is **early-stage, experimental software**. session 2 ships hooks, adapters, and 20 new commands; sessions 3–5 are unfinished. interfaces, agent contracts, skill descriptions, rule formats, hook signatures, adapter layouts, and install scripts may change without notice and without migration paths.

**do your own research (DYOR)** before relying on STUDIO for anything that matters:

- read every agent, skill, rule, and hook before running them. they encode opinions and they execute on your machine.
- review every output before shipping it. agents and skills will be wrong sometimes.
- validate generated copy, prds, audits, scopes, and recommendations against your own context, audience, and legal/compliance requirements.
- treat anything STUDIO produces as a draft, not a deliverable.
- audit the hook scripts under `scripts/hooks/` and each adapter's `install.sh` before running them — they modify your harness config and write to your home directory.

**no warranty.** STUDIO is provided "as is" under the MIT license. there is no guarantee of accuracy, originality, fitness for any purpose, security, or availability. the author and contributors accept no liability for losses, damages, missed deadlines, brand harm, leaked information, or any other consequence arising from use of this repo.

**not professional advice.** nothing in STUDIO constitutes legal, financial, medical, security, accessibility-compliance, or other professional advice. accessibility audits, brand guidance, product specs, and copy reviews here are starting points — not substitutes for qualified review.

**operator owns the output.** content generated through STUDIO via any harness (claude code, cursor, codex, opencode, gemini, zed, vscode, etc.) is the responsibility of the operator running the harness, not the author of STUDIO.

**no affiliation.** STUDIO is not affiliated with, endorsed by, or sponsored by Anthropic, Cursor, OpenAI, Google, Zed Industries, GitHub/Microsoft, Figma, Notion, Linear, PostHog, or any other company referenced in agents, skills, adapters, or examples. all trademarks belong to their respective owners.

if any of this is a problem for your use case, do not install STUDIO. fork it, audit it, or wait for a stable release.

see [DISCLAIMER.md](DISCLAIMER.md) for the long form.
