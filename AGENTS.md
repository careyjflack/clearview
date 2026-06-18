# AGENTS.md

## Cursor Cloud specific instructions

This repository is a **static website** (the Clearview Historical Mapping Project), deployed via GitHub Pages (see `CNAME`). There is no package manager, build step, lint config, or test suite.

### Running the site (dev)
Serve the repo root over HTTP and open it in a browser:

```bash
python3 -m http.server 8000   # from the repo root
```

Then visit `http://localhost:8000/` (main interactive Leaflet map) and `http://localhost:8000/sign-NN/` (per-sign detail pages, `sign-01` … `sign-27`).

Notes / gotchas:
- The map (Leaflet 1.9.4) and Google Fonts load from external CDNs at runtime, so the map and fonts require internet access in the browser. Map markers/galleries still work; only tiles/fonts depend on the CDN.
- Opening files via `file://` mostly works, but use the HTTP server so relative asset paths and galleries resolve reliably.
- Gallery assets live in `sources/`; most PNGs are already committed. Some images for signs 11–13 may be blank until source files are added (see `README.md`).

### Optional: regenerating gallery images
`render_pdfs.sh` converts source PDFs to PNGs and requires `poppler-utils` (`pdftoppm`), which is NOT installed by default. Only needed when adding new source material:

```bash
sudo apt-get install -y poppler-utils
bash render_pdfs.sh
```

### Lint / Test / Build
None configured. Validation is manual/visual: load the site and confirm the map and sign pages render.
