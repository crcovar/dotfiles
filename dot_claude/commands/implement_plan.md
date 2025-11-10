# Implement Plan

You are in IMPLEMENTATION MODE for the Claude Code workflow. Your goal is to execute the plan one phase at a time with continuous validation.

## Task
Implement the plan. The user must provide:
- Reference to plan document: `@~/thoughts/shared/plans/[filename].md`

## Implementation Approach

1. **Read and Understand the Plan**
   - Load the plan document
   - Review all phases and success criteria
   - Understand dependencies and integration points

2. **Phase-by-Phase Execution**
   - Implement ONE phase at a time
   - Follow the specific steps outlined in the plan
   - Make the exact changes specified (file paths, line numbers)
   - DO NOT skip ahead to later phases

3. **Continuous Validation**
   After EACH phase:
   - Run all automated verification steps
   - Prompt user for manual verification
   - Wait for user confirmation before proceeding
   - Fix any issues before moving to next phase

4. **Adaptive Implementation**
   - If you discover the plan needs adjustment, discuss with the user
   - Update the plan document if significant changes are needed
   - Document any deviations in the plan file

## Implementation Workflow

For each phase:

```
1. Announce: "Starting Phase N: [Phase Name]"
2. Review phase objectives and files to modify
3. Implement the changes as specified
4. Run automated verification:
   - Execute test commands
   - Verify expected outputs
   - Check for errors or warnings
5. Request manual verification:
   - "Please verify: [manual checks from plan]"
   - Wait for user confirmation
6. Mark phase as complete
7. Check context usage (should stay < 60%)
8. Proceed to next phase or stop if user requests
```

## Important Rules

- DO implement exactly ONE phase at a time
- DO run verification after each phase
- DO wait for user confirmation before proceeding
- DO keep context under 60% (check with /context)
- DO update the plan if you discover issues
- DON'T skip verification steps
- DON'T implement all phases without pausing
- DON'T ignore test failures

## Context Management

Monitor context usage:
- Check context before starting each phase
- If approaching 60%, save progress and clear context
- Use file-based memory (save notes to `~/thoughts/personal/notes/`)
- Resume from the last completed phase

## Error Handling

If a phase fails:
1. Document the specific error
2. Attempt to fix the issue
3. Re-run verification
4. If unable to resolve, ask user for guidance
5. DO NOT proceed to next phase with failing tests

## Progress Tracking

Update the plan document to track progress:
- Add `✅` next to completed phases
- Add `🚧` next to current phase
- Add notes about any deviations or discoveries

## Example Output

```
Starting Phase 1: Setup Database Schema

Implementing changes to:
- src/db/schema.ts:45-67
- src/db/migrations/001_initial.sql

[makes changes]

Running automated verification:
✅ npm run test:db passed
✅ Migration runs successfully

Manual verification needed:
- Please check that the database schema matches the design
- Verify foreign key constraints are correct

Waiting for your confirmation to proceed to Phase 2...
```

After all phases are complete, inform the user they can validate the implementation with `/validate_plan @~/thoughts/shared/plans/[filename].md`.
