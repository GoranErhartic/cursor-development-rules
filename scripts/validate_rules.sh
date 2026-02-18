#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

python3 "${SCRIPT_DIR}/validate_rule_links.py"
python3 "${SCRIPT_DIR}/validate_router_coverage.py"
python3 "${SCRIPT_DIR}/validate_frontmatter.py"
python3 "${SCRIPT_DIR}/validate_token_budget.py"
