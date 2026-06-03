# 🚀 Claude Code to Gemini / Antigravity Plugin Converter

A native, instruction-based skill/plugin for **Google Gemini / Antigravity** designed to download, convert, refactor, and install any external plugins or skills built for **Anthropic Claude Code**.

---

## 🌟 Features

- **Dynamic Instruction-Based Skill:** Implemented natively using Antigravity's skill architecture (`SKILL.md`).
- **Autoparsing & Structural Adaptation:** Moves `plugin.json` from `.claude-plugin/` to the root directory and renames `.claude-plugin/` folders to `.gemini-plugin/` to satisfy Antigravity requirements.
- **Smart Refactoring:** Rewrites filenames, variables, commands, and script instructions (replacing Claude-specific entities with Gemini/Antigravity entities, including standard environment variables like `GEMINI_PLUGIN_ROOT`).
- **Auto-validation & Installation:** Seamlessly executes `agy plugin validate` and `agy plugin install` to register plugins directly.

---

## 📦 Quick Install in Antigravity

To install this converter plugin natively in your Antigravity environment, run the following commands:

```bash
# Clone this repository
git clone https://github.com/tr1xx-tech/claude-to-gemini-converter.git /root/claude-to-gemini-converter

# Install using the agy CLI
agy plugin install /root/claude-to-gemini-converter
```

Once installed, it will appear in your plugin list:
```bash
agy plugin list
```

---

## 💡 How to Use

Simply ask your Antigravity assistant in natural language to download and convert any Claude Code plugin/repository. The agent will automatically detect the skill and run the workflow.

### Example Prompts:
* *"Import the Claude Code plugin SimoneAvogadro/android-reverse-engineering-skill"*
* *"Convert and install the skill from https://github.com/SimoneAvogadro/android-reverse-engineering-skill"*

### Step-by-Step Skill Workflow:
1. **Clones** the Claude Code plugin repo into a temporary folder.
2. **Restructures** the folder, renaming `.claude-plugin` to `.gemini-plugin` and moving `plugin.json` to the root directory.
3. **Refactors** file content and filenames (changing occurrences of `claude` to `gemini`, `claudecode`/`claude-code` to `antigravity`, and `CLAUDE_PLUGIN_ROOT` to `GEMINI_PLUGIN_ROOT`).
4. **Validates** the converted plugin with `agy plugin validate`.
5. **Registers/Installs** it with `agy plugin install`.
6. **Cleans up** temporary files.

---

## 📄 License

Distributed under the Apache License 2.0. See the `LICENSE` file for details.
