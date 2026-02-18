# Changelog

All notable changes to this rules suite should be documented in this file.

The format is based on Keep a Changelog, and this project follows semantic versioning for rule releases.

## [Unreleased]

### Added
- Validation toolchain under `scripts/` (`validate_rule_links.py`, `validate_router_coverage.py`, `validate_frontmatter.py`, `validate_token_budget.py`, `validate_rules.sh`)
- CI validation workflow: `.github/workflows/rules-validation.yml`
- `QUICK_START.mdc` for faster operator/agent discovery
- Optional domain pack namespace: `domains/real-estate/aws-lambda/*`

### Changed
- Rule precedence and conflict protocol added to `agent-behavior.mdc`
- Decision-tree workflow shortcuts added to `rule-index.mdc`
- Router quick-reference sections added across all stack routers
- Inconsistent/broken references and contradictory wording corrected in key rules
- Root and rules README activation/domain-pack guidance aligned

### Deprecated
- None

### Removed
- `languages/aws-lambda/real-estate-domain.mdc`
- `languages/aws-lambda/real-estate-events.mdc`
- `languages/aws-lambda/real-estate-rules.mdc`
