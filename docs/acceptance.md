# Release acceptance

The gallery is live at **https://yuxiaoli.github.io/openrouter-charts/**. The public repository is https://github.com/yuxiaoli/openrouter-charts, with `develop` as its default and production branch. The initial `main` baseline is preserved at `0533a8d98e858a5028b912fc3b1a65d7c91c8d72`.

This is a dated release receipt, not a claim that future jobs have already run. The currently served `version.json` and Actions history are the authority for later builds.

## Publication and refresh

- [Implementation PR #1](https://github.com/yuxiaoli/openrouter-charts/pull/1) passed review and CI, then merged normally into `develop` at `700ff949b3b0e66be5aaf9f2b5bda2ecf2880ffc`.
- [Release deployment](https://github.com/yuxiaoli/openrouter-charts/actions/runs/42861862149) succeeded. Pages serves the exact source commit above. Pages uses the Actions build type, HTTPS and a deployment environment limited to `develop`.
- [Manual refresh](https://github.com/yuxiaoli/openrouter-charts/actions/runs/42862888497) succeeded through fresh archive download, checksum validation, all tests, all 14 renders, artifact upload and Pages deployment. The public `generated_at` advanced while source commit, snapshot and archive commit remained unchanged. Detailed version receipts are in [live-receipt.json](live-receipt.json).
- An independent probe against the real published gallery returned `changed=false` for unchanged archive revision, snapshot, latest attempt and source commit. Scheduled checks therefore retain the existing site when nothing changed.
- The hourly schedule is enabled in the default branch at minute 17. This receipt verifies the manual execution path and unchanged-state detection; the first natural scheduled run and the next new daily snapshot are not claimed as observed here. GitHub can delay schedules or disable them after prolonged repository inactivity.

## Source and data checks

The published source fixture is archive commit `e0b6f46bfae683cce14269bfcde632552aeffd8a`, snapshot `2026-11-10T093020Z-eb9b8257a8`, completed `2026-11-10T09:36:43.114Z`.

- A fresh remote probe resolved the existing archive to that immutable commit.
- Downloaded 90 existing archive files for 23 chart-input datasets. Physical/logical SHA-256 digests and record/chunk counts were verified. Production downloads reject missing storage checksum entries.
- The remaining five public datasets are represented by actual manifest coverage metadata rather than unnecessary bulk downloads. There are 28 allowlisted public dataset types in total.
- All 14 PNGs were rebuilt from freshly downloaded data and independently from an existing archive checkout. No OpenRouter upstream requests or private-account collection were added.
- Anonymous HTTP checks verified all 14 published PNG signatures and SHA-256 digests against the published source manifest, plus HTML, CSS, JavaScript, version and coverage assets.

## Automated and visual checks

- 21 Python tests passed for public-data boundaries, path safety, complete-snapshot selection, gzip/checksum/count validation, required production checksum entries, unchanged/manual/code-change refresh paths, newer failed attempts and snapshot mismatch rejection.
- Five JavaScript behavior tests passed for filtering/reset, search/empty recovery, repeated zoom/close/reopen, backdrop behavior and stale-age warnings.
- JSON Schema examples, source registry, generated version metadata, all chart identities/hashes and relative page assets passed. JavaScript syntax, Python compile and shell command-reference syntax passed.
- Independent chart/contact-sheet review confirmed the original fourteen Chinese layouts, white background, blue/gold palette, units and caveats.
- Real desktop Chromium browsing passed search, category filtering, empty-state recovery, original-image navigation, zoom opening, Escape/close and reopening with the correct image. The final lazy-loaded chart loaded successfully.
- An actual browser PNG download succeeded. The file was 312,770 bytes; its SHA-256 is recorded in the receipt.

## Verification limits

Responsive CSS is implemented, but physical mobile devices, Safari and mobile-device emulation have not been verified. The page offers full-resolution image links even without JavaScript. Future upstream snapshot changes and future natural scheduled runs require their own actual observations; they are not inferred from this release test. GitHub Actions currently emits nonblocking Node-runtime deprecation notices for some third-party actions; the verified runs succeeded.
