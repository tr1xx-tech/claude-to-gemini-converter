---
name: claude-to-gemini-converter
description: Convert and install any Claude Code plugin or skill to Gemini/Antigravity. Use when the user requests to download, convert, import, or install a Claude Code plugin or skill.
---

# Claude Code to Gemini / Antigravity Plugin Converter

This skill instructs you on how to import, rewrite, and install any external Claude Code plugin or skill, converting it to be fully compatible with Gemini and Antigravity.

## Workflow

When the user requests to convert/install a Claude Code plugin (e.g. from GitHub `owner/repo` or a URL):

### Step 1: Download the plugin
1. Create a temporary folder, e.g. `/tmp/import-plugin-<name>`.
2. Clone the Git repository or copy the local files into that folder:
   ```bash
   git clone <repository-url> /tmp/import-plugin-<name>
   ```

### Step 2: Restructure directory
1. Locate the `plugin.json` file.
   - If it is located under `.claude-plugin/plugin.json`, move it to the root of the plugin directory as `plugin.json`.
   - If no `plugin.json` exists but there is a `SKILL.md` file, create a default `plugin.json` in the root:
     ```json
     {
       "name": "<sanitized-plugin-name>",
       "version": "1.0.0",
       "description": "Converted Claude Code plugin",
       "skills": "./"
     }
     ```
2. Rename the `.claude-plugin` directory to `.gemini-plugin` or `.antigravity-plugin` if it exists.

### Step 3: Refactor filenames and file contents
For all files and directories in the plugin:
1. Rename any file or directory containing the word `claude` (case-insensitive) to use `gemini` (or `antigravity`) instead. Specifically, rename `CLAUDE.md` to `GEMINI.md`.
2. Edit file contents (using your editing tools) to replace all occurrences of Claude terms with Gemini terms:
   - `claude-code` or `claudecode` ➜ `antigravity`
   - `CLAUDE_PLUGIN_ROOT` ➜ `GEMINI_PLUGIN_ROOT`
   - `Claude Code` or `claude code` ➜ `Gemini/Antigravity`
   - `claude` / `Claude` / `CLAUDE` ➜ `gemini` / `Gemini` / `GEMINI`
3. Maintain the integrity of all code, scripts, paths, and commands, adapting only names and system variables.

### Step 4: Validate and Install
1. Validate the plugin structure:
   ```bash
   agy plugin validate /tmp/import-plugin-<name>
   ```
2. If validation succeeds, install it:
   ```bash
   agy plugin install /tmp/import-plugin-<name>
   ```
3. If validation fails, read the output, fix the files accordingly, and retry.

### Step 5: Clean up
Remove the temporary cloning directory:
```bash
rm -rf /tmp/import-plugin-<name>
```
Report the successful installation to the user.
