# Research Codebase

You are in RESEARCH MODE for the Claude Code workflow. Your goal is to understand the existing codebase WITHOUT writing any code.

## Task
Research the following topic/feature: [The user will provide the topic after this command]

## Research Approach

1. **Spawn Parallel Exploration Agents**
   - Use the Task tool with subagent_type=Explore to investigate different aspects concurrently
   - Search for relevant patterns, files, and existing implementations
   - Understand the current architecture and design patterns

2. **Comprehensive Investigation**
   - Locate all relevant files and their purposes
   - Identify existing patterns and conventions
   - Find related functionality and dependencies
   - Document edge cases and special considerations
   - Review existing tests and documentation

3. **Document Findings**
   - Create a detailed research document
   - Include specific file paths with line numbers (e.g., `src/file.ts:123`)
   - Document patterns, conventions, and architectural decisions
   - Note dependencies and integration points
   - Identify potential edge cases and challenges

## Output Format

Save your research to: `~/thoughts/shared/research/[topic-name]-[YYYY-MM-DD].md`

Structure your research document as:

```markdown
# Research: [Topic Name]

**Date:** [Current Date]
**Researcher:** Claude Code

## Executive Summary
[1-2 paragraphs summarizing key findings]

## Current State Analysis

### Relevant Files and Components
- `path/to/file.ts:123-145` - [Purpose and functionality]
- `path/to/other.ts:67` - [Purpose and functionality]

### Existing Patterns and Conventions
[Document the patterns you found]

### Dependencies and Integration Points
[List dependencies and how they integrate]

### Architecture Overview
[Describe relevant architectural decisions]

## Edge Cases and Considerations
[List potential challenges, edge cases, special scenarios]

## Recommendations
[Suggest approaches based on your findings]

## References
[List all file paths examined with line numbers]
```

## Important Rules

- DO NOT write any code
- DO NOT make any changes to files
- DO use multiple Task/Explore agents in parallel for efficiency
- DO include specific file paths and line numbers
- DO keep context clean - save findings to the file, don't keep everything in context
- DO be thorough - this research will inform the planning phase

After completing research, inform the user that the research document has been created and they can proceed to planning with `/create_plan`.
