# fundamental-analysis

Fundamental Analysis en LuaLaTeX, completamente containerizado con Docker para compilaciones **reproducibles** y portables.

---

## 📂 Estructura del proyecto

```text
fundamental-analysis/
├── Dockerfile           # Dockerfile para construir el entorno LaTeX
├── README.md
├── LICENSE
├── src/                 # Archivos fuente
│   ├── main.tex         # Archivo principal LaTeX
│   ├── sample.bib
│   ├── config/          # Archivos de configuración
│   ├── sections/        # Capítulos o secciones
│   └── images/          # Figuras e imágenes
└── out/                 # Archivos generados (PDF, logs, etc.)
```

* Coloca tu archivo principal `.tex` en `src/` (por defecto: `src/main.tex`).
* Usa `sections/` para capítulos, `images/` para figuras y `config/` para configuraciones.
* Todos los artefactos de compilación se generan en `out/`, manteniendo el código fuente limpio.

---

## ⚙️ Construcción de la imagen Docker

1. Construye la imagen Docker:

   ```bash
   docker build -t fundamental-analysis-tex .
   ```

   > Esto creará una imagen con LuaLaTeX lista para compilar tu proyecto.

2. Ejecuta la compilación:

   ```bash
   docker run --rm -v "$(pwd):/work" fundamental-analysis-tex
   ```

   * Compila `src/main.tex`.
   * Genera PDF y archivos auxiliares en `out/`.
   * Si la carpeta `out/` no existe, Docker la creará automáticamente.

---

## 🛠️ Desarrollo en VSCode con Dev Containers

Para una experiencia de desarrollo **fluida y reproducible**:

1. Instala la extensión **Remote – Containers** en VSCode.

2. Crea una carpeta `.devcontainer/` con un archivo `devcontainer.json` que especifique:

   * Imagen Docker (`fundamental-analysis-tex`)
   * Carpeta de trabajo (`workspaceFolder`)
   * Extensiones recomendadas, como LaTeX Workshop

3. Abre el proyecto y ejecuta **Remote-Containers: Open Folder in Container**.

> Esto te permite editar los archivos LaTeX en `src/` y compilar automáticamente dentro del contenedor.

### Explicación devcontainer.json cada sección

`devcontainer.json` contenido:

```json
{
    "name": "Fundamental Analysis LaTeX",
    "image": "fundamental-analysis-tex",
    "workspaceFolder": "/work",
    "mounts": [
        "source=${localWorkspaceFolder},target=/work,type=bind,consistency=cached"
    ],
    "extensions": [
        "James-Yu.latex-workshop"
    ],
    "settings": {
        "latex-workshop.latex.outDir": "out",
        "latex-workshop.latex.autoBuild.run": "onFileChange",
        "latex-workshop.latex.clean.enabled": true
    }
}
```

| Campo             | Qué hace                                                                                                                                                                          |
| ----------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `name`            | Nombre del contenedor de desarrollo en VSCode                                                                                                                                     |
| `image`           | Imagen Docker que se va a usar (`fundamental-analysis-tex`)                                                                                                                       |
| `workspaceFolder` | Carpeta dentro del contenedor donde se montará tu proyecto (`/work`)                                                                                                              |
| `mounts`          | Monta tu proyecto local dentro del contenedor para que los cambios se reflejen en tiempo real                                                                                     |
| `extensions`      | Instala automáticamente extensiones en VSCode dentro del contenedor. Aquí usamos **LaTeX Workshop**                                                                               |
| `settings`        | Configuraciones de LaTeX Workshop: <br> - `outDir` → carpeta de salida <br> - `autoBuild.run` → compilar al guardar <br> - `clean.enabled` → limpiar archivos auxiliares antiguos |


---

## 🛠️ Uso con cualquier IDE o editor

Si utilizas otro IDE (JetBrains, Cursor, Sublime, etc.) o un editor de texto plano:

1. Ejecuta el contenedor en modo interactivo:

   ```bash
   docker run -it -v "$(pwd):/work" -w /work fundamental-analysis-tex bash
   ```

2. Dentro del contenedor, ejecuta compilación continua:

   ```bash
   latexmk -pdf -outdir=out -pvc src/main.tex
   ```

   * `-pvc` (**preview continuously**) recompila automáticamente cada vez que guardas un archivo.
   * Todos los PDFs y archivos auxiliares se generan en `out/`.
   * Funciona con **cualquier editor**, gracias al volumen montado (`$(pwd):/work`).

---
## 📜 Licencia
Este proyecto está licenciado bajo la Licencia MIT. Consulta el archivo [LICENSE](LICENSE) para más detalles.


