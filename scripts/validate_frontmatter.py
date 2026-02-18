#!/usr/bin/env python3
"""Validate .mdc frontmatter schema and metadata taxonomy."""

from __future__ import annotations

import re
import sys
from pathlib import Path


RULES_ROOT = Path(__file__).resolve().parents[1] / ".cursor" / "rules"
FRONTMATTER_RE = re.compile(r"^---\n(.*?)\n---\n", re.DOTALL)

ALLOWED_COMPLEXITY = {"beginner", "intermediate", "advanced"}
OPTIONAL_KEYS = {
    "tags",
    "complexity",
    "relatedRules",
    "dependsOn",
    "deprecated",
    "replacedBy",
    "lastReviewed",
}


def parse_frontmatter(text: str) -> dict[str, str]:
    match = FRONTMATTER_RE.match(text)
    if not match:
        return {}
    result: dict[str, str] = {}
    for raw_line in match.group(1).splitlines():
        line = raw_line.strip()
        if not line or line.startswith("#") or ":" not in line:
            continue
        key, value = line.split(":", 1)
        result[key.strip()] = value.strip()
    return result


def main() -> int:
    errors: list[str] = []
    warnings: list[str] = []

    for file_path in sorted(RULES_ROOT.rglob("*.mdc")):
        text = file_path.read_text(encoding="utf-8")
        fm = parse_frontmatter(text)
        rel = file_path.relative_to(RULES_ROOT)
        if not fm:
            errors.append(f"{rel}: missing frontmatter")
            continue
        if "description" not in fm:
            errors.append(f"{rel}: missing description")
        for key in OPTIONAL_KEYS:
            if key not in fm:
                warnings.append(f"{rel}: missing optional metadata key `{key}`")
        if "complexity" in fm:
            clean = fm["complexity"].strip("\"'")
            if clean not in ALLOWED_COMPLEXITY:
                errors.append(f"{rel}: invalid complexity `{clean}`")
        if "deprecated" in fm:
            clean = fm["deprecated"].lower()
            if clean not in {"true", "false"}:
                errors.append(f"{rel}: deprecated must be true/false")
        if "lastReviewed" in fm:
            clean = fm["lastReviewed"].strip("\"'")
            if not re.match(r"^\d{4}-\d{2}-\d{2}$", clean):
                errors.append(f"{rel}: lastReviewed must be YYYY-MM-DD")

    if warnings:
        print("Metadata warnings:")
        for warning in warnings[:120]:
            print(f" - {warning}")
        if len(warnings) > 120:
            print(f" - ... {len(warnings) - 120} more warnings")

    if errors:
        print("Frontmatter validation errors:")
        for error in errors:
            print(f" - {error}")
        return 1

    print("OK: frontmatter schema valid.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
