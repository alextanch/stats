#!/bin/bash
set -euo pipefail

# Удаляет служебные файлы: артефакты сборки LaTeX и кэши Python/Jupyter.
# Не трогает .tex, .pdf, .ipynb, .md, а также .venv и .git.
#
# Example launch:
# bash clean.sh

cd "$(dirname "$0")"

# артефакты сборки LaTeX
find . \( -name .venv -o -name .git \) -prune -o -type f \( \
    -name '*.aux' -o -name '*.log' -o -name '*.out' -o -name '*.toc' \
    -o -name '*.fls' -o -name '*.fdb_latexmk' -o -name '*.xdv' \
    -o -name '*.synctex.gz' -o -name '*.bbl' -o -name '*.blg' \
    -o -name '*.nav' -o -name '*.snm' -o -name '*.vrb' \
\) -print -exec rm -f {} +

# кэши Python и Jupyter
find . \( -name .venv -o -name .git \) -prune -o -type d \( \
    -name '__pycache__' -o -name '.ipynb_checkpoints' \
    -o -name '.ruff_cache' -o -name '.pytest_cache' \
\) -print -prune -exec rm -rf {} +
