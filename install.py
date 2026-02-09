import os
import shutil
import sys
import argparse
from pathlib import Path

def sync_dir(src, dest, description):
    """Syncs a directory by replacing it if it exists."""
    if not src.exists():
        print(f"Warning: Source {description} directory not found at {src}. Skipping.")
        return

    print(f"Syncing {description} to {dest}...")
    dest.parent.mkdir(parents=True, exist_ok=True)
    
    if src.is_file():
        # Handle single file (like workflows)
        shutil.copy2(src, dest)
    else:
        # Handle directory (like rules/skills)
        if dest.exists():
            shutil.rmtree(dest)
        shutil.copytree(src, dest)

def install_all(base_dir):
    # 1. Rules (Docs -> .claude/rules)
    claude_rules_path = Path.home() / ".claude" / "rules"
    rules_src = base_dir / "docs" / "rules"
    # We want to copy the contents of docs/rules (common, python, etc.)
    if rules_src.exists():
        for item in rules_src.iterdir():
            if item.is_dir() and item.name not in [".git", "__pycache__"]:
                sync_dir(item, claude_rules_path / item.name, f"Rule: {item.name}")

    # 2. Skills (skills/ -> .gemini/antigravity/skills)
    antigravity_base = Path.home() / ".gemini" / "antigravity"
    skills_src = base_dir / "skills"
    if skills_src.exists():
        for item in skills_src.iterdir():
            if item.is_dir() and item.name not in [".git", "__pycache__"]:
                sync_dir(item, antigravity_base / "skills" / item.name, f"Skill: {item.name}")

    # 3. Workflows (.agent/workflows/ -> .gemini/antigravity/workflows)
    workflows_src = base_dir / ".agent" / "workflows"
    if workflows_src.exists():
        for item in workflows_src.iterdir():
            if item.is_file() and item.suffix == ".md":
                sync_dir(item, antigravity_base / "workflows" / item.name, f"Workflow: {item.name}")

    print("\nGlobal installation complete!")

if __name__ == "__main__":
    script_dir = Path(__file__).parent.absolute()
    
    parser = argparse.ArgumentParser(description="Global Everything-Antigravity Installer")
    # Add support for flags if needed later
    
    print("Everything Antigravity: Global Sync Initialized\n")
    try:
        install_all(script_dir)
    except Exception as e:
        print(f"Critical Error: {e}")
        sys.exit(1)
