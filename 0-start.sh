#!/usr/bin/env -S bash

set -euo pipefail
SCRIPT_NAME=$(realpath $0)
cd ${SCRIPT_NAME%/*}

git submodule update --init --recursive
