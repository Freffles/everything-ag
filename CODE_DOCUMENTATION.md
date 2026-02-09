# Code Documentation

This document describes the technical organization and implementation details of the **Everything Antigravity** repository.

## 🏗️ Architecture: The Triad Pattern

The repository is built around three core abstractions that work together to guide AI agents:

### 1. Agents (`/agents`)
Agents are defined in Markdown files with YAML frontmatter. 
- **Metadata**: Name and description.
- **Content**: Instructions, checklists, and procedures specific to that persona.
- **Inheritance**: Agents reference rules and skills to perform their duties.

### 2. Rules (`/docs/rules`)
The rules system uses a layered inheritance model:
- **Common Layer**: Found in `rules/common/`. These are language-agnostic principles.
- **Language Layer**: Found in directories like `rules/python/`. These files **extend** common rules using relative markdown links (e.g., `> This file extends [common/coding-style.md](../common/coding-style.md)`).
- **Validation**: Rules serve as the "law" for code quality checks.

### 3. Skills (`/skills`)
Skills are deep-reference modules.
- **Structure**: Each skill is a directory containing a `SKILL.md` (and sometimes supporting scripts/examples).
- **Format**: Uses YAML frontmatter to define the skill's purpose and capabilities.
- **Activation**: Agents "activate" these skills when performing specialized tasks.

## 🔗 Cross-Referencing Logic

- **Rules -> Skills**: Language-specific rule files contain links to relevant skills for "How-To" implementation.
- **Agents -> Rules/Skills**: Agents are instructed to follow the rules and leverage skills during their execution cycle.

## 🚀 Global Synchronization (`/install.py`)

The repository includes a global synchronization engine that deploys internal assets to their operational directories:

- **Hierarchy to Global Mapping**:
    - `docs/rules/[lang]` -> `~/.claude/rules/[lang]`
    - `skills/[skill-name]` -> `~/.gemini/antigravity/skills/[skill-name]`
    - `.agent/workflows/*.md` -> `~/.gemini/antigravity/workflows/*.md`

- **Execution Flow**:
    1.  **Context Detection**: Identifies the user's home directory and OS.
    2.  **Asset Discovery**: Scans local directories for valid agentic assets.
    3.  **Atomic Sync**: Replaces global targets with local versions to ensure consistency.

## 🛠️ Maintenance

When adding new languages or skills:
1.  **For Rules**: Create a new directory under `docs/rules/` and ensure relative links back to `./common/` are valid.
2.  **For Skills**: Create a new folder under `skills/` with a `SKILL.md`.
3.  **For Workflows**: Add `.md` files to `.agent/workflows/`.
4.  **Sync**: Run the root `install.py` to deploy changes globally.

---
*Last updated: February 2026*
