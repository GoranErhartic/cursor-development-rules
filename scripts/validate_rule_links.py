#!/usr/bin/env python3
"""Validate .mdc backtick rule references resolve to files."""

from __future__ import annotations

import re
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1] / ".cursor" / "rules"
REF_RE = re.compile(r"`([^`]+\.mdc)`")


def resolve_candidates(source: Path, raw_ref: str) -> list[Path]:
    ref = Path(raw_ref)
    if raw_ref.startswith("/"):
        return [Path(raw_ref)]
    return [
        (source.parent / ref).resolve(),
        (ROOT / ref).resolve(),
    ]


def main() -> int:
    broken: list[tuple[str, str]] = []
    for file_path in sorted(ROOT.rglob("*.mdc")):
        text = file_path.read_text(encoding="utf-8")
        for match in REF_RE.finditer(text):
            ref = match.group(1)
            if "*" in ref:
                continue
            if not any(candidate.exists() for candidate in resolve_candidates(file_path, ref)):
                broken.append((str(file_path.relative_to(ROOT)), ref))

    if broken:
        print("Broken rule references:")
        for rel, ref in broken:
            print(f" - {rel} -> {ref}")
        return 1

    print("OK: all concrete .mdc references resolve.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
