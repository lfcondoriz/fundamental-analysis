# latex-template
Reusable LaTeX (LuaLaTeX) template for reports and academic documents

## Docker

### Build the Docker image

```bash
docker compose -f docker/docker-compose.yml build
```

### Single compilation

Compile the document once and exit:

```bash
docker compose -f docker/docker-compose.yml run --rm latex
```

The compiled PDF will be generated in the `out/` directory as `main.pdf`.

### Continuous compilation (watch mode)

To keep the container running and recompile automatically whenever `.tex` files change, add the `-pvc` flag to the command:

```bash
docker compose -f docker/docker-compose.yml run --rm latex latexmk -pvc main.tex
```

Alternatively, start the service in detached mode and view the logs:

```bash
docker compose -f docker/docker-compose.yml up -d
docker compose -f docker/docker-compose.yml logs -f
```

To stop the service:

```bash
docker compose -f docker/docker-compose.yml down
```

## Configuration

- LaTeX compilation runs from within the `src/` directory, so all relative paths in your `.tex` files should be relative to `src/`.
- Compilation settings are defined in `src/latexmkrc` (output directory, PDF mode, interaction mode).
- The output PDF is always generated in `out/main.pdf`. 