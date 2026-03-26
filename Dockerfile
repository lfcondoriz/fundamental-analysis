FROM maxkratz/texlive:latest

WORKDIR /work

RUN mkdir -p /work/out

COPY src/ /work/src/

CMD ["latexmk", "-cd", "-pdf", "-interaction=nonstopmode", "-halt-on-error", "-outdir=../out", "src/main.tex"]