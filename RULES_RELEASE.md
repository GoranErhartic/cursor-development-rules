# Cursor Rules Release and Maintenance

This file defines how the rules suite evolves safely over time.

## Versioning Model

Use semantic versioning for the suite:

- MAJOR: Breaking guidance changes (behavioral contract changes, renamed key rules, removed rule files)
- MINOR: Backward-compatible rule additions or substantial improvements
- PATCH: Clarifications, typo fixes, link fixes, small non-breaking updates

## Deprecation Lifecycle

When deprecating a rule:

1. Keep the old file in place for at least one minor release.
2. Mark in frontmatter:
   - `deprecated: true`
   - `replacedBy: "path/to/new-rule.mdc"`
3. Add migration notes in this file under the active release section.
4. Remove only in the next MAJOR release.

## Migration Notes Template

For each breaking change, add:

- Changed rule(s)
- Old behavior
- New behavior
- Migration action for maintainers
- Effective version

## Rule Health Cadence

- Monthly:
  - Run `./scripts/validate_rules.sh`
  - Fix broken links, metadata violations, and router coverage drift
- Quarterly:
  - Review low-signal or redundant rules
  - Rebalance token budgets for always-applied and routers
  - Review domain pack separation and opt-in status

## Release Checklist

- Validation scripts pass locally and in CI
- No broken concrete references
- Router coverage validated
- Frontmatter schema valid for required fields
- Budget limits not exceeded for hard checks
- Migration notes updated for breaking changes
