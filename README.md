# OpenRouter Charts

A daily public-data chart collection built from [OpenRouter Data](https://github.com/yuxiaoli/openrouter-data). The site preserves the original fourteen Chinese charts: white backgrounds, blue/gold palette, labeled units and source caveats. Search, filter, enlarge and download full-resolution PNGs.

Intended GitHub Pages destination: `https://yuxiaoli.github.io/openrouter-charts/`. Publication status is tracked in [acceptance](docs/acceptance.md); this URL is not a claim of deployment until verified there.

## Data and refresh

- **One complete snapshot per gallery.** All 14 charts use the same latest complete-success archive run. A newer partial or failed attempt is disclosed, never blended into the figures.
- **No duplicate collection.** This repository only downloads allowlisted public files from a pinned commit on the existing `openrouter-data` data branch. It never requests OpenRouter upstream endpoints, requires an OpenRouter key or accesses private account data.
- **Daily snapshots, hourly reconciliation.** Upstream is scheduled for 01:23 UTC daily. This project checks the archive at minute 17 of every hour and rebuilds only when archive revision, chosen snapshot, latest attempt or source commit changes. It also supports manual refresh and deployment on `develop` pushes. Actions schedules may be delayed and GitHub may disable scheduled workflows after 60 days of public-repository inactivity.
- **Failure safety.** Download/checksum/schema/render failures fail the job before publication, retaining the previous Pages site. The page displays its true data time and marks it stale after 36 hours. A latest partial/failed attempt is shown on the next successful metadata/chart build. The page does not falsely claim real-time streaming or a fixed delivery SLA.
- **Traceability.** `version.json`, `coverage.json` and `charts/sources_and_scope.json` provide source commit, archive commit, snapshot, all 28 public dataset counts, units/windows, caveats and output hashes. Source and build time are distinct.

## The fourteen views

1. Model catalog and capabilities
2. Catalog prices and public performance
3. Weekly model rankings
4. Public historical trends and open/closed mix
5. Eight modality request histories
6. Task categories and share distributions
7. Public application usage
8. Session-cost distributions across model medians
9. Provider endpoints and availability observations
10. Representative model activity
11. Provider, router and discovery series
12. Content and dataset coverage
13. Public benchmarks on separate scales
14. API capabilities and public provider policies

These are bounded public samples, not a verified whole-platform census or personal usage report. Datasets overlap. Unknown units remain unknown; null values are not turned into zero. Open/closed labels do not imply a particular license. Incomplete final daily/weekly buckets are distinguished from complete periods. Catalog prices are not invoices; performance is not a quality score. See the notes on each chart.

## Build locally

Requirements: Python 3.11+, [uv](https://docs.astral.sh/uv/), Git, Node for the JavaScript syntax check, and Noto Sans CJK at `/usr/share/fonts/opentype/noto/NotoSansCJK-Regular.ttc` (Ubuntu `fonts-noto-cjk`).

```sh
uv sync --frozen
uv run python -m unittest discover -s tests -v
uv run python scripts/check_contracts.py
node --check web/app.js
node --test tests/test_ui.cjs
uv run python scripts/fetch_snapshot.py probe
uv run python scripts/fetch_snapshot.py fetch
uv run python scripts/build_site.py
uv run python scripts/check_contracts.py --site dist
uv run python -m http.server 8000 --directory dist
```

An existing archive checkout can be reused with `--archive-root /absolute/path`. The downloaded cache and generated site are ignored by Git. Public source data is not duplicated into this repository; the deploy job uploads only a generated static artifact.

## GitHub Pages

Remote default and production source branch: **develop**. Preserve the initial `main` baseline. Normal changes use a feature branch and reviewed PR into `develop`.

Set the repository's Pages source to **GitHub Actions**. The `pages.yml` workflow grants read-only source access to the build job and only `pages: write` / `id-token: write` to the deploy job. No personal token or repository secret is required. The `github-pages` environment must allow deployment from `develop`; do not bypass existing protections. The project has no backend, analytics or external browser dependencies.

See [design](docs/DESIGN.md), [commands](scripts/commands.sh), [acceptance](docs/acceptance.md) and [data contracts](data/version.schema.json).

Independent project, not operated by or endorsed by OpenRouter. Upstream data remains attributed to its sources. No broader rights in third-party data are asserted.
