# latex-template
Reusable LaTeX (LuaLaTeX) template for reports and academic documents.

## Docker usage

This project uses a prebuilt Docker image:
`maxkratz/texlive:latest`

No Dockerfile or image build is required.

---

## Single compilation

Compile the document once and exit:

```bash
docker compose -f docker/docker-compose.yml run --rm latex
````

The compiled PDF will be generated in:

```
out/main.pdf
```

---

## Continuous compilation (watch mode)

Automatically recompile when `.tex` files change:

```bash
docker compose -f docker/docker-compose.yml run --rm latex latexmk -pvc main.tex
```

---

## Optional: run in background

Start the container in detached mode:

```bash
docker compose -f docker/docker-compose.yml up -d
```

View logs:

```bash
docker compose -f docker/docker-compose.yml logs -f
```

---

## Stop service

```bash
docker compose -f docker/docker-compose.yml down
```

---

## Project structure

* `src/` → LaTeX source files (main.tex, chapters, settings)
* `out/` → generated PDF and auxiliary files
* `docker/docker-compose.yml` → LaTeX execution environment

---

## Configuration

* Compilation runs from `/work/src`
* Output is written to `/work/out`
* Settings are defined in `src/latexmkrc`
* Entry point: `src/main.tex`

---

## Notes

* The previous Dockerfile is deprecated and no longer used.
* All compilation is handled via `docker compose` + prebuilt image.
* No local LaTeX installation is required.