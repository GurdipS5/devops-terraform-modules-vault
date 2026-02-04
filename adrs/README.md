# Architecture Decision Records (ADRs)

This directory contains Architecture Decision Records (ADRs) documenting the key architectural and design decisions made for this Vault Terraform module.

## What are ADRs?

Architecture Decision Records are documents that capture important architectural decisions made along with their context and consequences. They help:

- **Document why** decisions were made, not just what decisions
- **Preserve context** for future team members
- **Track evolution** of the architecture over time
- **Facilitate discussion** about design choices

## ADR Management

This project uses the [adg](https://github.com/matzefriedrich/architecture-decision-records) CLI tool for managing ADRs.

### Viewing ADRs

List all decisions:
```bash
adg list --model adrs
```

View a specific decision:
```bash
adg view --model adrs --id 0001
```

### Creating New ADRs

Add a new decision:
```bash
adg add --model adrs --title "Your decision title here"
```

### Deciding on Options

Mark a decision as decided:
```bash
adg decide --model adrs --id 0001 --option "Option name" --force --rationale "Explanation"
```

## Current ADRs

### Decided

- **ADR-0004**: Use Terraform native testing framework for module validation
  - **Decision**: Use Terraform/OpenTofu native testing with .tftest.hcl files
  - **Rationale**: Native testing framework provides built-in validation without external dependencies

- **ADR-0005**: Map-based configuration for flexible resource management
  - **Decision**: Use map-based configuration with for_each
  - **Rationale**: Provides flexibility and allows dynamic resource creation based on input variables

- **ADR-0006**: Comprehensive examples for different use cases
  - **Decision**: Provide multiple example configurations
  - **Rationale**: Helps users understand different use cases and implementation patterns

### Open

- **ADR-0001**: Modular approach for secret engines
- **ADR-0002**: Auth methods
- **ADR-0003**: And policies

## ADR Template

Each ADR follows this structure:

```markdown
---
adr_id: "XXXX"
title: Decision title
status: open|decided|superseded
tags: []
links:
    precedes: []
    succeeds: []
comments: []
---

## Question
What is the architectural decision to be made?

## Options
1. Option 1 description
2. Option 2 description

## Criteria
What criteria are we using to evaluate the options?

## Outcome
The chosen option and rationale (when decided)

## Comments
Discussion and additional context
```

## Best Practices

1. **Be concise** - Keep ADRs focused on a single decision
2. **Provide context** - Explain why the decision was needed
3. **List alternatives** - Document options that were considered
4. **Explain trade-offs** - Be clear about pros and cons
5. **Link related ADRs** - Show relationships between decisions
6. **Keep them immutable** - Don't delete or heavily edit old ADRs; create new ones that supersede them instead

## Contributing

When making architectural decisions:

1. Create a new ADR using `adg add`
2. Document the question and options
3. Discuss with the team
4. Mark as decided when consensus is reached
5. Reference the ADR in related code/documentation

---

For more information about ADRs, see:
- [ADR GitHub Organization](https://adr.github.io/)
- [Documenting Architecture Decisions](https://cognitect.com/blog/2011/11/15/documenting-architecture-decisions)
