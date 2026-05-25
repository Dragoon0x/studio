#!/usr/bin/env bash
# STUDIO installer (basic, session 1)
# usage: ./install.sh --target claude [--rules common,design,brand]

set -e

TARGET="claude"
RULES="common,design,product,brand,copy"

while [[ $# -gt 0 ]]; do
  case $1 in
    --target)
      TARGET="$2"
      shift 2
      ;;
    --rules)
      RULES="$2"
      shift 2
      ;;
    *)
      echo "unknown arg: $1"
      exit 1
      ;;
  esac
done

if [ "$TARGET" != "claude" ]; then
  echo "session 1 supports only --target claude. cursor, codex, opencode adapters ship in session 2."
  exit 1
fi

CLAUDE_DIR="$HOME/.claude"
mkdir -p "$CLAUDE_DIR/agents"
mkdir -p "$CLAUDE_DIR/skills/studio"
mkdir -p "$CLAUDE_DIR/commands"
mkdir -p "$CLAUDE_DIR/rules/studio"

echo "installing STUDIO into $CLAUDE_DIR..."

cp agents/*.md "$CLAUDE_DIR/agents/"
echo "  agents copied"

cp -r skills/* "$CLAUDE_DIR/skills/studio/"
echo "  skills copied"

cp commands/*.md "$CLAUDE_DIR/commands/"
echo "  commands copied"

IFS=',' read -ra RULE_DIRS <<< "$RULES"
for dir in "${RULE_DIRS[@]}"; do
  if [ -d "rules/$dir" ]; then
    cp -r "rules/$dir" "$CLAUDE_DIR/rules/studio/"
    echo "  rules/$dir copied"
  else
    echo "  warning: rules/$dir not found, skipping"
  fi
done

echo ""
echo "STUDIO installed."
echo "agents: $(ls $CLAUDE_DIR/agents | wc -l | tr -d ' ')"
echo "skills: $(ls $CLAUDE_DIR/skills/studio | wc -l | tr -d ' ')"
echo "commands: $(ls $CLAUDE_DIR/commands | wc -l | tr -d ' ')"
echo "rules: $(ls $CLAUDE_DIR/rules/studio | wc -l | tr -d ' ')"
