# Validate Plan

You are in VALIDATION MODE for the Claude Code workflow. Your goal is to systematically verify that the implementation matches the plan specifications.

## Task

Validate the implementation against the plan. The user must provide:

- Reference to plan document: `@~/thoughts/shared/plans/[filename].md`

## Validation Approach

1. **Load Plan and Implementation**
   - Read the plan document thoroughly
   - Review recent commits (if in git repo)
   - Examine all files mentioned in the plan

2. **Systematic Verification**
   For each phase in the plan:
   - Verify all specified files were modified/created
   - Check that changes match the plan specifications
   - Confirm automated verification steps pass
   - Review success criteria are met

3. **Gap Analysis**
   - Identify any plan items not implemented
   - Find deviations from the plan
   - Spot potential issues or edge cases not handled

4. **Generate Validation Report**
   - Document what was verified
   - List any discrepancies
   - Provide recommendations

## Validation Checklist

### Code Changes

- [ ] All files in plan were modified/created
- [ ] Changes match plan specifications
- [ ] No unplanned changes were made
- [ ] Code follows existing patterns/conventions

### Testing

- [ ] All automated tests pass
- [ ] Manual verification steps completed
- [ ] Edge cases are handled
- [ ] No new warnings or errors

### Success Criteria

- [ ] All success criteria from plan are met
- [ ] Feature works as intended
- [ ] Integration points function correctly

### Code Quality

- [ ] No security vulnerabilities introduced
- [ ] Error handling is appropriate
- [ ] Code is maintainable and documented

## Output Format

Save validation report to: `~/thoughts/shared/plans/[YYYY-MM-DD]-[topic-name]-validation.md`

Structure the report as:

```markdown
# Validation Report: [Topic Name]

**Date:** [Current Date]
**Plan:** [Link to plan document]
**Validator:** Claude Code

## Summary

[Overall assessment: Pass/Partial/Fail]
[Brief summary of findings]

---

## Phase-by-Phase Validation

### Phase 1: [Phase Name]

**Status:** ✅ Pass / ⚠️ Partial / ❌ Fail

**Expected Changes:**

- `path/to/file.ts` - [What was planned]

**Actual Implementation:**

- `path/to/file.ts:123` - [What was done]

**Verification Results:**

- ✅ Automated tests pass
- ✅ Manual verification complete

**Issues Found:**

- [Any discrepancies or concerns]

---

[Repeat for each phase]

---

## Success Criteria Review

- ✅ [Criterion 1] - Met
- ⚠️ [Criterion 2] - Partially met: [explanation]
- ❌ [Criterion 3] - Not met: [explanation]

## Deviations from Plan

### Intentional Changes

- [Change 1]: [Reason]

### Unplanned Changes

- [Change 1]: [Impact assessment]

## Issues Identified

### Critical

- [Issue that must be fixed]

### Minor

- [Issue that should be addressed]

### Suggestions

- [Improvement recommendations]

## Test Results

### Automated Tests
```

[Test command output]

```

### Manual Testing
- [What was tested]
- [Results]

## Code Quality Assessment

**Security:** [Assessment]
**Maintainability:** [Assessment]
**Performance:** [Assessment]
**Error Handling:** [Assessment]

## Recommendations

1. [Action item 1]
2. [Action item 2]
3. [Action item 3]

## Conclusion

[Final assessment and next steps]
```

## Validation Commands

Run these to gather information:

```bash
# If in git repo
git log --oneline -10
git diff [base-branch]...HEAD --stat
git diff [base-branch]...HEAD

# Run tests
npm test           # or appropriate test command
npm run build      # verify build succeeds

# Check for issues
npm run lint       # if available
npm run type-check # if available
```

## Important Rules

- DO be thorough and objective
- DO check every phase from the plan
- DO run all automated verification steps
- DO identify both positive and negative findings
- DO provide actionable recommendations
- DON'T assume - verify everything
- DON'T skip verification steps
- DON'T ignore warnings or minor issues

## After Validation

Based on the validation results:

- **All Pass:** Implementation is complete and correct
- **Partial Pass:** Address identified issues and re-validate
- **Fail:** Significant issues found, return to implementation phase

Present the validation report to the user and discuss next steps.
