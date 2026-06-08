---
name: claude-to-gemini-converter
description: Convert and install any Claude Code plugin or skill to Gemini/Antigravity. Use when the user requests to download, convert, import, or install a Claude Code plugin or skill.
---

# Claude Code to Gemini / Antigravity Plugin Converter

This skill instructs you on how to import, rewrite, and install any external Claude Code plugin or skill, converting it to be fully compatible with Gemini and Antigravity.

## Workflow

When the user requests to convert/install a Claude Code plugin or skill (e.g. from GitHub `owner/repo` or a URL):

### Guidelines:
- **Quiet Operation:** Do not write verbose descriptions or log your progress step-by-step to the user. Perform all cloning, renaming, refactoring, and moving actions silently. Only print a concise confirmation message once the installation is successfully completed.

### Step 1: Download the repository
1. Create a temporary folder, e.g. `/tmp/import-skill-<name>`.
2. Clone the Git repository or copy the local files into that folder:
   ```bash
   git clone <repository-url> /tmp/import-skill-<name>
   ```
3. Delete the `.git` directory to prevent copying git history metadata and speed up processing:
   ```bash
   rm -rf /tmp/import-skill-<name>/.git
   ```

### Step 2: Locate the skill directory
1. Check if there is a `skills/` directory inside `/tmp/import-skill-<name>`.
   - If a `skills/` directory exists, look inside it for the subfolder containing `SKILL.md` (for example, `skills/<skill-name>/`). That subfolder will be your target skill directory.
   - If no `skills/` directory exists, check the root `/tmp/import-skill-<name>` for `SKILL.md`. If `SKILL.md` is at the root, the root folder is your target skill directory.
2. Verify that `SKILL.md` exists in the target skill directory. If not, look recursively for a directory containing `SKILL.md`.

### Step 3: Refactor filenames and file contents
Inside the target skill directory:
1. Rename any file or directory containing the word `claude` (case-insensitive) to use `gemini` (or `antigravity`) instead. Specifically, rename `CLAUDE.md` to `GEMINI.md`.
2. Edit file contents (using your editing tools) to replace all occurrences of Claude terms with Gemini terms:
   - `claude-code` or `claudecode` ➜ `antigravity`
   - `CLAUDE_PLUGIN_ROOT` ➜ `GEMINI_SKILL_ROOT`
   - `Claude Code` or `claude code` ➜ `Gemini/Antigravity`
   - `claude` / `Claude` / `CLAUDE` ➜ `gemini` / `Gemini` / `GEMINI`
3. Maintain the integrity of all code, scripts, paths, and commands, adapting only names and system variables.
4. **Verify YAML Frontmatter in `SKILL.md`:** Ensure that the converted `SKILL.md` contains a proper YAML frontmatter block at the very top (delimited by `---`) with correct `name` and `description` fields (e.g., `name: <skill-name>`). If it is missing or doesn't have the `name` field, add it so the skill doesn't display as `/SKILL`.


### Step 4: Install the skill
1. Ensure the destination directory exists:
   ```bash
   mkdir -p ~/.gemini/skills
   ```
2. Move or copy the target skill directory to `~/.gemini/skills/<skill-name>`, where `<skill-name>` is the name of the folder containing the skill.

### Step 5: Clean up
Remove the temporary cloning directory:
```bash
rm -rf /tmp/import-skill-<name>
```
Report the successful installation to the user.
