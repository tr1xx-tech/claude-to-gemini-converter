#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "=============================================="
echo "🚀 Claude Code to Gemini/Antigravity Installer"
echo "=============================================="

SKILL_DIR="$HOME/.gemini/skills/claude-to-gemini"

if [ -d "$SKILL_DIR" ]; then
    echo "🔄 Found existing installation at $SKILL_DIR"
    echo "🧹 Removing old version to update..."
    rm -rf "$SKILL_DIR"
else
    echo "📦 Preparing installation..."
fi

# Ensure parent directory exists
mkdir -p "$HOME/.gemini/skills"

echo "📥 Cloning standalone skill branch..."
git clone -q -b skill https://github.com/tr1xx-tech/claude-to-gemini-converter.git "$SKILL_DIR"

echo "🧹 Cleaning up git metadata..."
rm -rf "$SKILL_DIR/.git"

echo "✅ Successfully installed/updated claude-to-gemini skill!"
echo "💡 You can now convert Claude Code plugins by asking your assistant in natural language."
