# Design Philosophy

Everything Antigravity is guided by a set of core ideologies that prioritize clarity, reliability, and modularity in agentic coding.

## 🧠 Core Ideology

### 1. Small is Beautiful
We prefer **Many Small Files** over a few large ones. 
- High cohesion within modules.
- Low coupling between components.
- Easier for LLMs to consume and process without context window exhaustion.

### 2. Explicit over Implicit
Magic is discouraged.
- Coding rules must be stated explicitly.
- Error handling should be verbose and traceable.
- Intent should be clear from file names and directory structures.

### 3. Immutability as a Foundation
Immutability is treated as a critical principle across all languages.
- Reduces side effects.
- Simplifies state management.
- Enables safer concurrent processing.

## 🛠️ Operational Principles

### The "Sync Everything" Ideology
We believe that local development and global deployment should be a single heartbeat.
- **Global Consistency**: Updates made to a local rule or skill should be instantly deployable to the user's global AI personality.
- **Tool-Agnostic Execution**: Installation scripts (Python, Shell, PowerShell) serve the same purpose: ensuring the environment is capable, regardless of the operating system.

### The "Rules vs Skills" Distinction
- **Rules are Constraints**: They define the "What" and "Should Not". They are the guardrails.
- **Skills are Capabilities**: They define the "How". They are the instructions for action.
- By separating constraints from capabilities, we allow the framework to evolve independently.

### Human-AI Collaboration
This repository is designed to be readable by both humans and AI agents. 
- Markdown is the primary format for instructions.
- Clear headings and checklists ensure that agents can extract actionable tasks efficiently.

## 🚀 Goal
The ultimate goal of this project is to create an **Autonomous Coding Standard** that makes AI-driven development predictable, secure, and extremely high-performance.

---
*The best structure is the one that disappears.*
