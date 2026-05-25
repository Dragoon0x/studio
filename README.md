# STUDIO

harness-native operator system for design, product and brand work.

agents, skills, hooks, rules and commands for ai coding agents like claude code, cursor, codex, and opencode. installable as a plugin, configurable per profile, MIT licensed.

## what's in it

```
studio/
├── agents/         15 specialist agents
├── skills/         30 skills across design, product, brand
├── commands/       6 slash commands
├── rules/          23 rules across common, design, product, brand, copy
├── hooks/          runtime placeholder (session 2)
├── mcp-configs/    figma, notion, linear, posthog
└── scripts/        install + utilities
```

## agents (15)

design-reviewer, design-system-auditor, accessibility-reviewer, brand-voice-keeper, copywriter, microcopy-writer, product-strategist, ux-research-synthesizer, competitor-analyst, naming-generator, narrative-architect, taxonomy-architect, release-narrator, case-study-writer, pitch-deck-writer.

## skills (30)

**design (10)**: design-review, design-system-audit, accessibility-audit, figma-handoff-spec, component-spec, motion-direction, responsive-rules, dark-mode-pairing, iconography-system, data-viz-design.

**product (10)**: prd-writing, spec-writing, research-synthesis, jtbd-framing, roadmap-planning, feature-scoping, metric-design, ab-test-design, competitive-analysis, launch-planning.

**brand (10)**: brand-voice-extraction, naming-generation, tagline-writing, positioning-statement, messaging-architecture, value-prop-writing, microcopy-writing, landing-copy, case-study-writing, release-narrative.

## commands (6)

`/design-review`, `/prd`, `/brand-check`, `/name`, `/copy-review`, `/a11y-scan`.

## rules

23 rules across five lanes. always-follow guidelines that hold across projects.

- common (5): principles, process, handoff, research, decisions
- design (5): spacing, type, color, motion, accessibility
- product (5): prd-structure, jtbd, metrics, specs, research-standards
- brand (5): voice, tone-matrix, banned-words, naming-conventions, messaging-hierarchy
- copy (3): sentence-rhythm, anti-ai-tone, active-voice

## install

### claude code (plugin)

```bash
claude plugin install Dragoon0x/studio
```

### manual

```bash
git clone https://github.com/Dragoon0x/studio.git
cd studio
./install.sh --target claude
```

### with rule selection

```bash
./install.sh --target claude --rules common,design,brand
```

windows:

```powershell
.\install.ps1 -Target claude -Rules "common,design,brand"
```

## structure of a skill

every skill is a folder with a SKILL.md. frontmatter declares name and description. body is workflow markdown.

```
skills/
└── design-review/
    └── SKILL.md
```

skills load on-demand when their description matches the user's intent.

## structure of an agent

every agent is a single .md file with frontmatter (name, description, tools, model) and a body that defines how the agent behaves.

## what's not in session 1

- hooks runtime (placeholder file ships; actual hooks ship in session 2)
- cross-harness adapters for cursor, codex, opencode (session 2)
- additional commands beyond the core 6 (session 2)
- mcp config real values (placeholder env vars; user fills in)
- dashboard ui (session 3)
- docs site (session 4)

session plan in CHANGELOG.md.

## license

MIT. see LICENSE.

## disclaimer

see DISCLAIMER.md. opinions in agents and skills are starting points; override them when context demands it. content generated through STUDIO is the responsibility of the operator running the harness.

## contributing

issues and PRs welcome at github.com/Dragoon0x/studio.

## author

Dragoon0x.

---

## status: experimental — DYOR

STUDIO is **early-stage, experimental software**. session 1 is a public scaffold; sessions 2–5 are unfinished. interfaces, agent contracts, skill descriptions, rule formats, and install scripts may change without notice and without migration paths.

**do your own research (DYOR)** before relying on STUDIO for anything that matters:

- read every agent, skill, and rule before running them. they encode opinions.
- review every output before shipping it. agents and skills will be wrong sometimes.
- validate generated copy, prds, audits, and recommendations against your own context, audience, and legal/compliance requirements.
- treat anything STUDIO produces as a draft, not a deliverable.

**no warranty.** STUDIO is provided "as is" under the MIT license. there is no guarantee of accuracy, originality, fitness for any purpose, security, or availability. the author and contributors accept no liability for losses, damages, missed deadlines, brand harm, leaked information, or any other consequence arising from use of this repo.

**not professional advice.** nothing in STUDIO constitutes legal, financial, medical, security, accessibility-compliance, or other professional advice. accessibility audits, brand guidance, product specs, and copy reviews here are starting points — not substitutes for qualified review.

**operator owns the output.** content generated through STUDIO via any harness (claude code, cursor, codex, opencode, etc.) is the responsibility of the operator running the harness, not the author of STUDIO.

**no affiliation.** STUDIO is not affiliated with, endorsed by, or sponsored by Anthropic, Cursor, OpenAI, Figma, Notion, Linear, PostHog, or any other company referenced in agents, skills, or examples. all trademarks belong to their respective owners.

if any of this is a problem for your use case, do not install STUDIO. fork it, audit it, or wait for a stable release.

see [DISCLAIMER.md](DISCLAIMER.md) for the long form.
