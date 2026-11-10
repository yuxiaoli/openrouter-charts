# Implementation plan

- Reuse the original fourteen chart scopes and existing public snapshot archive. Complete.
- Build pinned archive verification, dynamic labels and the responsive static gallery. Complete.
- Establish a separate public repository, preserve the initial main baseline and use develop as the default and deployment branch. Complete.
- Run local and cloud tests, independent actual-data rendering and visual review. Complete: 21 Python tests, five JavaScript behavior tests, contracts and all fourteen charts passed.
- Publish through a reviewed feature PR and GitHub Pages. Complete: implementation PR #1 and deployment run 42861862149.
- Verify anonymous live assets, image hashes and desktop browser interactions/downloads. Complete; mobile/Safari verification limits are disclosed in docs/acceptance.md.
- Verify manual cloud refresh and a real unchanged-snapshot probe. Complete: run 42862888497; unchanged probe returned false.
- Keep future natural scheduled executions and the next new daily snapshot distinct from the configuration and manual-run evidence. See the actual Actions history and live version metadata.
