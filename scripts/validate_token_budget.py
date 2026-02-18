#!/usr/bin/env python3
"""Validate line-based token budget guardrails for rules."""

from __future__ import annotations

import sys
from pathlib import Path


RULES_ROOT = Path(__file__).resolve().parents[1] / ".cursor" / "rules"
ALWAYS_APPLIED_MAX_LINES = 140
ROUTER_MAX_LINES = 140
RULE_MAX_LINES = 260

ALWAYS_APPLIED = {"agent-behavior.mdc", "project-context.mdc"}
ROUTERS = {
    "languages/aws-lambda/nodejs-lambda.mdc",
    "languages/nodejs/nodejs-base.mdc",
    "languages/java/java-spring.mdc",
    "languages/csharp/csharp-dotnet.mdc",
    "languages/react/react-frontend.mdc",
}


def count_lines(path: Path) -> int:
    return len(path.read_text(encoding="utf-8").splitlines())


def main() -> int:
    warnings: list[str] = []
    errors: list[str] = []

    always_lines = 0
    for name in ALWAYS_APPLIED:
        path = RULES_ROOT / name
        always_lines += count_lines(path)
    if always_lines > ALWAYS_APPLIED_MAX_LINES:
        errors.append(
            f"always-applied total lines {always_lines} exceeds {ALWAYS_APPLIED_MAX_LINES}"
        )

    for router_rel in ROUTERS:
        lines = count_lines(RULES_ROOT / router_rel)
        if lines > ROUTER_MAX_LINES:
            errors.append(f"{router_rel} has {lines} lines (> {ROUTER_MAX_LINES})")

    for file_path in RULES_ROOT.rglob("*.mdc"):
        rel = file_path.relative_to(RULES_ROOT).as_posix()
        lines = count_lines(file_path)
        if lines > RULE_MAX_LINES:
            warnings.append(f"{rel} has {lines} lines (> {RULE_MAX_LINES})")

    if warnings:
        print("Budget warnings:")
        for warning in warnings:
            print(f" - {warning}")

    if errors:
        print("Budget errors:")
        for error in errors:
            print(f" - {error}")
        return 1

    print("OK: budget hard limits passed.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
