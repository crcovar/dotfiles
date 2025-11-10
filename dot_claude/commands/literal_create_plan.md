# Create Implementation Plan

You are in PLANNING MODE for the Claude Code workflow. Your goal is to create a detailed, iterative implementation plan based on research findings.

## Task

Create an implementation plan. The user should provide:

- Reference to research document (e.g., `@~/thoughts/shared/research/[filename].md`)
- OR describe the feature/task to plan

## Planning Approach

1. **Review Research (if provided)**
   - Read the research document thoroughly
   - Understand the current state, patterns, and constraints
   - Identify integration points and dependencies

2. **Iterative Refinement (5+ iterations required)**
   - Start with a high-level approach
   - Break down into specific phases (typically 3-7 phases)
   - For each iteration, ask yourself:
     - What edge cases am I missing?
     - What could go wrong?
     - How will I verify this works?
     - Are the phases granular enough?
   - Use AskUserQuestion tool to clarify ambiguities
   - Refine until the plan is concrete and actionable

3. **Define Success Criteria**
   - What does "done" look like?
   - How will we verify each phase?
   - What are the acceptance criteria?

## Output Format

Save your plan to: `~/thoughts/shared/plans/[YYYY-MM-DD]-[topic-name].md`

Structure your plan as:

```markdown
# Implementation Plan: [Topic Name]

**Date:** [Current Date]
**Based on Research:** [Link to research doc if applicable]

## Goal

[Clear statement of what we're building and why]

## Success Criteria

- [ ] [Criterion 1]
- [ ] [Criterion 2]
- [ ] [Criterion 3]

## Approach Overview

[1-2 paragraphs describing the high-level approach]

---

## Phase 1: [Phase Name]

### Objective

[What this phase accomplishes]

### Files to Modify/Create

- `path/to/file.ts:123-145` - [What changes to make]
- `path/to/new-file.ts` - [What to create]

### Implementation Steps

1. [Specific step with code snippet if helpful]
2. [Specific step with code snippet if helpful]
3. [Specific step with code snippet if helpful]

### Verification

**Automated:**

- [ ] [Test command to run]
- [ ] [Expected output]

**Manual:**

- [ ] [Thing to check manually]
- [ ] [Thing to test in UI/manually]

### Potential Issues

- [What could go wrong and how to handle it]

---

## Phase 2: [Phase Name]

[Repeat structure for each phase]

---

## Dependencies

- [External libraries needed]
- [System requirements]

## Rollback Plan

[How to undo changes if something goes wrong]

## Notes

[Any additional context or considerations]
```

## Important Rules

- DO spend 30-45 minutes iterating on this plan
- DO break work into phases that can be validated independently
- DO include specific file paths and line numbers
- DO define both automated and manual verification steps
- DO anticipate edge cases and failure modes
- DO use AskUserQuestion if anything is unclear
- DON'T rush - a good plan saves time during implementation
- DON'T make assumptions - clarify with the user

## Planning Checklist

Before finalizing, verify:

- [ ] Each phase has clear objectives
- [ ] Each phase has specific file paths
- [ ] Each phase has verification steps
- [ ] Edge cases are identified
- [ ] Dependencies are listed
- [ ] Success criteria are measurable
- [ ] Plan has been iterated 5+ times

After completing the plan, inform the user they can proceed to implementation with `/implement_plan @~/thoughts/shared/plans/[filename].md`.
