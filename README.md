# LaTeX Template

> Plantilla profesional para documentos académicos e informes técnicos con LuaLaTeX, Docker y compilación automatizada.

[![TeX Live](https://img.shields.io/badge/TeX--Live-2024-blue?logo=tex)](https://tug.org/texlive/)
[![LuaLaTeX](https://img.shields.io/badge/LuaLaTeX-1.18-blue?logo=latex)](https://www.luatex.org/)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

---

## Características

- **LuaLaTeX** — motor moderno con soporte Unicode y tipografía avanzada
- **Compilación con Docker** — entorno reproducible, sin instalación local
- **Estructura modular** — secciones independientes con `subfiles`
- **Compilación en caliente** — `latexmk -pvc` reconstruye automáticamente al guardar
- **BibLaTeX + Biber** — gestión bibliográfica moderna con UTF-8 nativo
- **cleveref** — referencias cruzadas inteligentes (detecta tipo: figura, tabla, ecuación)
- **microtype** — espaciado y justificación profesional
- **VS Code Dev Container** — editor preconfigurado con LaTeX Workshop
- **Líneas decorativas** — elementos visuales con TikZ

---

## Requisitos

- [Docker](https://docs.docker.com/get-docker/) + [Docker Compose](https://docs.docker.com/compose/install/)
- Opcional: [VS Code](https://code.visualstudio.com/) con extensión [Dev Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

---

## Cómo empezar

### 1. Configurar metadatos

Edita `src/settings/metadata.tex`:

```tex
\newcommand{\doctitle}{Título de tu Documento}
\newcommand{\docauthor}{Tu Nombre}
\newcommand{\docdate}{\today}
```

### 2. Compilar el documento

```bash
docker compose -f docker/docker-compose.yml run --rm latex
```

El PDF se genera en `out/main.pdf`.

### 3. Ver el resultado

```
out/main.pdf
```

---

## Uso

### Compilación única

```bash
docker compose -f docker/docker-compose.yml run --rm latex
```

### Compilación continua (watch mode)

Recompila automáticamente al detectar cambios:

```bash
docker compose -f docker/docker-compose.yml run --rm latex latexmk -pvc main.tex
```

### Ejecutar en segundo plano

```bash
docker compose -f docker/docker-compose.yml up -d
docker compose -f docker/docker-compose.yml logs -f
```

### Detener el servicio

```bash
docker compose -f docker/docker-compose.yml down
```

---

## VS Code Dev Container

Este proyecto incluye un Dev Container listo para usar:

1. Abre el proyecto en VS Code
2. Ejecuta **Dev Containers: Reopen in Container**
3. El entorno incluye LaTeX Workshop con compilación automática al guardar

Configuración en `.devcontainer/devcontainer.json`:
- Extensiones: LaTeX Workshop
- Compilación con `latexmk` + LuaLaTeX
- Salida en `out/`
- Limpieza automática de archivos auxiliares

---

## Estructura del proyecto

```
.
├── .devcontainer/          # Configuración de VS Code Dev Container
│   ├── devcontainer.json
│   └── docker-compose.yml
├── assets/
│   └── images/             # Imágenes para el documento
├── docker/
│   └── docker-compose.yml  # Entorno de compilación LaTeX
├── out/                    # PDF generado y archivos auxiliares
├── src/
│   ├── sections/           # Contenido del documento (un archivo por sección)
│   ├── settings/           # Configuración del documento
│   │   ├── bibliography.tex
│   │   ├── decorations.tex
│   │   ├── header.tex
│   │   ├── links.tex
│   │   ├── macros.tex
│   │   ├── metadata.tex
│   │   ├── packages.tex
│   │   ├── settings.tex
│   │   ├── styles.tex
│   │   └── theorems.tex
│   ├── bibliography.bib    # Base de datos bibliográfica
│   ├── latexmkrc           # Configuración de latexmk
│   └── main.tex            # Punto de entrada del documento
├── .gitignore
├── LICENSE
└── README.md
```

### Secciones incluidas

| Archivo | Descripción |
|---|---|
| `sections/introduccion.tex` | Presentación de la plantilla y tecnologías utilizadas |
| `sections/personalizaciones.tex` | Demostración de las personalizaciones: macros, teoremas, cleveref, decoraciones, etc. |
| `sections/conclusion.tex` | Conclusiones y próximos pasos |

### Archivos de configuración

| Archivo | Propósito |
|---|---|
| `settings/metadata.tex` | Título, autor y fecha del documento |
| `settings/packages.tex` | Paquetes LaTeX cargados |
| `settings/styles.tex` | Colores y formato de secciones |
| `settings/theorems.tex` | Entornos: teorema, lema, proposición, ejemplo |
| `settings/header.tex` | Encabezado y pie de página |
| `settings/bibliography.tex` | Configuración de BibLaTeX |
| `settings/links.tex` | Hiperenlaces y referencias cruzadas |
| `settings/macros.tex` | Comandos personalizados |
| `settings/decorations.tex` | Elementos decorativos con TikZ |
| `latexmkrc` | Reglas de compilación (salida en `../out`, LuaLaTeX) |

---

## Personalización

### Añadir una nueva sección

1. Crea `src/sections/mi-seccion.tex`:

```tex
\documentclass[/work/src/main.tex]{subfiles}

\begin{document}
\section{Mi Sección}
Contenido de la sección.
\end{document}
```

2. Inclúyela en `src/main.tex`:

```tex
\subfile{sections/mi-seccion}
```

### Añadir imágenes

Coloca las imágenes en `assets/images/` e inclúyelas así:

```tex
\begin{figure}[h]
    \centering
    \includegraphics[width=0.5\textwidth]{mi-imagen.png}
    \caption{Descripción de la imagen}
    \label{fig:mi-imagen}
\end{figure}
```

### Compilar una sección individual

Cada sección puede compilarse por separado (útil para desarrollo rápido):

```bash
docker compose -f docker/docker-compose.yml run --rm latex latexmk sections/introduction.tex
```

---

## Tecnologías

- **LuaLaTeX** — motor tipográfico basado en LuaTeX
- **latexmk** — compilador automático con detección de cambios
- **BibLaTeX + Biber** — sistema de referencias moderno
- **subfiles** — gestión de documentos modulares
- **cleveref** — referencias inteligentes
- **Docker** — entorno reproducible
- **VS Code Dev Containers** — IDE preconfigurado

---

## Licencia

MIT — ver [LICENSE](LICENSE).
