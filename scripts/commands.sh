#!/usr/bin/env bash
# Command reference only. Copy and run individual commands as needed.
# Run commands from the project root unless stated otherwise.

# Install exact dependencies (Python 3.11+, uv, Node for JS syntax check).
uv sync --frozen
# Ubuntu/Linux renderer font dependency.
sudo apt-get install fonts-noto-cjk
# Unit tests, JSON Schema example validation, JavaScript syntax.
uv run python -m unittest discover -s tests -v
uv run python scripts/check_contracts.py
node --check web/app.js
node --test tests/test_ui.cjs
# Pin the existing public archive and verify downloaded chart datasets.
uv run python scripts/fetch_snapshot.py probe
uv run python scripts/fetch_snapshot.py fetch
# Render all charts and build static website.
uv run python scripts/build_site.py
uv run python scripts/check_contracts.py --site dist
# Alternative: reuse a local public archive checkout, without recollecting.
# uv run python scripts/build_site.py --archive-root /absolute/path/to/archive
# Preview website locally.
uv run python -m http.server 8000 --directory dist
# Inspect source and run the configured Pages workflow after authorized publication.
gh workflow run pages.yml --repo yuxiaoli/openrouter-charts --ref develop
gh run list --repo yuxiaoli/openrouter-charts --workflow pages.yml
