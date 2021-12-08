#!/bin/bash
set -eou pipefail
clear
make build -B
./run.sh --version
./run.sh --help
./run.sh $@
