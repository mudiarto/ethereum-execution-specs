

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