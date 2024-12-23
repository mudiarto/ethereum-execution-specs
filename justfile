
default:
  just --list

init:
    #!/usr/bin/env bash
    set -euxo pipefail
    source .venv/bin/activate
    uv pip install -r experiments/requirements.py

jupyter:
    #!/usr/bin/env bash
    set -euxo pipefail
    : "${PYTHONPATH:=''}"
    export PYTHONPATH=$PWD:$PYTHONPATH
    source .venv/bin/activate
    jupyter-lab

slides:
    #!/usr/bin/env bash
    set -euxo pipefail
    : "${PYTHONPATH:=''}"
    export PYTHONPATH=$PWD:$PYTHONPATH
    source .venv/bin/activate
    echo "Converting notebooks to slides and serving them at port 8000"
    jupyter nbconvert --to slides "experiments/notebooks/*.ipynb" --post serve --template=experiments/notebooks/reveal_code
