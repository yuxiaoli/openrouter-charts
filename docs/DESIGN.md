# Design

## Goal

Publish the same fourteen source-backed chart styles as a responsive, automatically refreshed GitHub Pages gallery. Reuse the existing public daily archive, never create a second collector.

## Pipeline

1. Resolve the source data branch to a 40-character immutable Git commit.
2. Read `public-index.json` at that commit, select its validated `last_success`, and retain metadata about the latest attempt.
3. Download the selected run's manifest, storage index and allowlisted chart dataset files. Validate public-only/complete status, physical and logical SHA-256 checksums where storage metadata exists, chunk counts and complete dataset counts.
4. Render all fourteen figures with the original Matplotlib style and CJK font. Derive dates, counts, examples and time-window labels from data. Reject incompatible structural changes rather than publish misleading figures.
5. Generate static HTML, CSS, JavaScript and provenance JSON in a temporary directory. Validate all fourteen files and relative links. Only then replace the local build output and upload a single Pages artifact.
6. Deploy from an identified `develop` commit. Verify public version metadata, assets, mobile/desktop browsing, search/filter and enlarged-image close/reopen behavior.

## Failure behavior

An archive partial/failed attempt never becomes the data snapshot. A complete older run remains identifiable and a warning is displayed. No prior complete run, missing required public dataset, checksum drift, schema drift or failed render blocks deployment. A failed refresh leaves the previous Pages deployment intact; client-side freshness age remains honest even if Actions stops. All fourteen charts are required, so silent partial galleries cannot ship.

Hourly checks reuse daily source snapshots, not streaming observations. Schedule times are nominal, not guaranteed. There are no credentials, paid resources, private data, analytics scripts, external fonts/CDNs or application cookies.

The related-repository registry uses the unmodified `repo-cli` schema from commit `6fdd5166f533964af0c75b4cd37d8ece65c17caf` (`data/repos.schema.json`). The source archive is not vendored into the repository.

## Interface

Server-generated accessible HTML with a responsive sidebar/gallery. Native image anchors and source links work without JavaScript; filters, search and native-dialog zoom enhance the page. Original full-resolution PNGs are downloadable. Zoom permits horizontal image scrolling on phones and closes through explicit button, Esc or backdrop. Search and filtering do not alter URL history.
