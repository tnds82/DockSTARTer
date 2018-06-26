#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

source "./tests/validate_newline.sh"
validate_newline
sudo bash ./main.sh -t validate_bashate
sudo bash ./main.sh -t validate_shellcheck
sudo bash ./main.sh -t run_install
sudo bash ./main.sh -t run_generate
