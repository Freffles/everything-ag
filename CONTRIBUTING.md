# Contributing to Everything Antigravity

First off, thank you for considering contributing to Everything Antigravity! It's people like you that make this ecosystem better for everyone.

## 🐛 Bug Reports

If you've found a bug, please create a GitHub Issue. Be sure to include:
- A clear, descriptive title.
- Steps to reproduce the bug.
- Actual behavior vs. expected behavior.
- Your OS and relevant version information (Claude Desktop version, etc.).

## ✨ Feature Requests

We're always looking for new Agents, Skills, and Rules! 
- Describe the problem this feature would solve.
- Outline how the new component should work.
- Provide examples if possible.

## 🛠️ Development Workflow

1.  **Fork** the repository on GitHub.
2.  **Clone** your fork locally:
    ```bash
    git clone https://github.com/krishnakanthb13/everything-antigravity.git
    ```
3.  **Create a branch** for your feature or fix:
    ```bash
    git checkout -b feature/my-new-feature
    ```
4.  **Implement your changes**:
    - Follow the [Coding Style](CODE_DOCUMENTATION.md#architecture-the-triad-pattern).
    - Ensure new files align with the [Design Philosophy](DESIGN_PHILOSOPHY.md).
5.  **Test your changes**:
    - Use the local `install.py` to sync your changes to your local environment and verify behavior.
6.  **Commit and Push**:
    ```bash
    git add .
    git commit -m "Add a brief but descriptive title"
    git push origin feature/my-new-feature
    ```
7.  **Submit a Pull Request** to the `main` branch.

## ✅ Pre-submission Checklist

- [ ] New files are in the correct directory (`agents/`, `skills/`, `docs/rules/`, or `.agent/workflows/`).
- [ ] Markdown files have correct headers and formatting.
- [ ] Relative links in `docs/rules/` are valid.
- [ ] The code follows the [Common Rules](docs/rules/common/coding-style.md).
- [ ] You have verified the changes locally using the `install.py` script.

---
*By contributing, you agree that your contributions will be licensed under the project's GPL v3 License.*
