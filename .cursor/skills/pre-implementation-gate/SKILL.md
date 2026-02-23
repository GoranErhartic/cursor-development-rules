---
name: pre-implementation-gate
description: Enforces the rule loading process before any code is written. Use BEFORE any implementation task — building features, implementing plans, creating modules, fixing bugs, refactoring code. Activates when the user says implement, build, create, fix, refactor, or any request that will produce code changes. MUST be followed as the FIRST action before writing any code.
---

# Pre-Implementation Gate

## Purpose

This skill enforces **process over speed**. It prevents the agent from jumping straight into coding by requiring rule discovery and loading before the first line of code is written.

The agent's natural bias is to produce output quickly. This gate exists to override that bias. A detailed user spec defines WHAT to build — rules define HOW to build it. Both are required.

## When This Skill Activates

Any request that will result in code changes:
- "implement this plan"
- "build feature X"
- "create a new module"
- "fix this bug"
- "refactor this code"
- Any variation of the above

## Gate Checklist

Copy this checklist and complete every step before writing code:

```
Pre-Implementation Gate:
- [ ] Step 1: project-context.mdc verified (populated, not placeholder)
- [ ] Step 2: Stack router loaded and read
- [ ] Step 3: 2–3 task-relevant rules loaded and read
- [ ] Step 4: development/code-implementation.mdc read
- [ ] Step 5: development/tdd-workflow.mdc read
- [ ] Step 6: Rules declared in response to user
```

## Step-by-Step Procedure

### Step 1 — Verify Project Context

Read the file at the path for `project-context.mdc` in the `.cursor/rules/` directory.

**If populated:** Extract the directory→router mapping. Proceed to Step 2.

**If placeholder or missing:** STOP. Tell the user:

> "Project context is not configured. I need to run project onboarding before I can implement. This analyzes the repo and maps it to the correct rules."

Then read `development/project-onboarding.mdc` and follow the onboarding procedure. Only proceed after `project-context.mdc` is written with real values.

### Step 2 — Load Stack Router

From the Active Stacks table in `project-context.mdc`, identify which router file matches the directories you will be touching.

Read that router file. It contains:
- The technology stack summary
- A task→rule mapping table
- Key conventions

### Step 3 — Load Task-Relevant Rules

Using the router's task→rule mapping, select **2–3 rules** most relevant to the current sub-task. Read each one.

Common selections by task type:

| Task type | Rules to load |
|-----------|--------------|
| Feature implementation | `testing.mdc`, `error-handling.mdc`, `code-quality.mdc` |
| API/controller work | `controllers.mdc`, `validation.mdc`, `error-handling.mdc` |
| Data fetching / HTTP clients | `http-clients.mdc`, `error-handling.mdc`, `testing.mdc` |
| Database work | `orm.mdc`, `testing.mdc`, `error-handling.mdc` |
| Security work | `security.mdc`, `input-sanitization.mdc`, `auth.mdc` |

### Step 4 — Load Development Workflow

Read `development/code-implementation.mdc`. This defines:
- Pre-work checklist
- TDD cycle steps
- Definition of Done verification
- Summary format requirements

### Step 5 — Load TDD Workflow

Read `development/tdd-workflow.mdc`. This defines:
- Red/Green/Refactor mandate
- Escape clause for trivial changes
- When TDD may be skipped (and documentation requirement)

### Step 6 — Declare Loaded Rules

Before writing any code, include a declaration block in your response:

```
## Rules Loaded

- **Project context:** [project name, project type]
- **Stack router:** [router file name]
- **Task rules:** [list of 2–3 rule files read]
- **Workflow rules:** code-implementation.mdc, tdd-workflow.mdc
```

This is the proof-of-process. If you cannot write this block, you have not completed the gate.

## Then — Implement

Only after the declaration block may you begin writing code. Follow:
1. The TDD workflow (RED → GREEN → REFACTOR)
2. The code-implementation DoD checklist
3. The conventions from the loaded stack/task rules

## Anti-Patterns This Skill Prevents

| Anti-pattern | What happens without the gate |
|-------------|-------------------------------|
| Eagerness bias | Agent sees detailed spec and jumps to coding, skipping all rules |
| Placeholder blindness | Agent reads empty project-context.mdc and silently works around it |
| Speed over process | Agent optimizes for fast output instead of correct process |
| Implicit rule skipping | Agent "knows" the patterns already and doesn't bother loading rules |
| Code-first testing | Agent writes implementation then tests, violating TDD mandate |
