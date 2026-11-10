# OpenRouter Charts

- Preserve the original 14-chart visual style and statistical caveats.
- Source is the public `yuxiaoli/openrouter-data` archive, never a second OpenRouter collector.
- Use one verified complete-success snapshot. Do not mix partial/fallback datasets or fill missing data with zero.
- Source code changes: branch from current `develop`, draft PR, real review/tests, merge to `develop`. `main` stays the initial baseline.
- Run `uv run python -m unittest discover -s tests -v`, `node --check web/app.js`, `node --test tests/test_ui.cjs`, `uv run python scripts/check_contracts.py`, and an actual snapshot build before delivery.
- Deploy only from `develop` using Pages Actions. Verify exact deployed version and desktop/mobile behavior; report schedule delays and verification limits honestly.
- Never commit credentials, a source archive copy, virtual environments or generated `dist/` images. The Pages artifact is the publication output.
