#!/usr/bin/env python3
"""Validate each language router references all rules in its stack folder."""

from __future__ import annotations

import re
import sys
from pathlib import Path


RULES_ROOT = Path(__file__).resolve().parents[1] / ".cursor" / "rules"
ROUTERS = {
    "aws-lambda": "languages/aws-lambda/nodejs-lambda.mdc",
    "nodejs": "languages/nodejs/nodejs-base.mdc",
    "java": "languages/java/java-spring.mdc",
    "csharp": "languages/csharp/csharp-dotnet.mdc",
    "react": "languages/react/react-frontend.mdc",
}

REF_RE = re.compile(r"`([^`]+\.mdc)`")


def normalize_ref(stack: str, ref: str) -> str:
    if ref.startswith(f"languages/{stack}/"):
        return Path(ref).name
    if "/" not in ref:
        return ref
    return ""


def main() -> int:
    failures: list[str] = []

    for stack, router_rel in ROUTERS.items():
        router_path = RULES_ROOT / router_rel
        router_text = router_path.read_text(encoding="utf-8")
        refs = {
            name
            for name in (normalize_ref(stack, ref) for ref in REF_RE.findall(router_text))
            if name
        }
        stack_dir = RULES_ROOT / "languages" / stack
        expected = {
            p.name
            for p in stack_dir.glob("*.mdc")
            if p.name != Path(router_rel).name
        }
        missing = sorted(expected - refs)
        if missing:
            failures.append(f"{stack}: missing from router -> {', '.join(missing)}")

    if failures:
        print("Router coverage failures:")
        for item in failures:
            print(f" - {item}")
        return 1

    print("OK: router coverage complete for all stacks.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
