#!/bin/bash
# set -euo pipefail
# IFS=$'\n\t'

sudo bash ./main.sh -t validate_newline
sudo bash ./main.sh -t validate_bashate
sudo bash ./main.sh -t validate_shellcheck
sudo bash ./main.sh -t run_install
sudo bash ./main.sh -t run_generate

# source "./tests/validate_bashate.sh"
# validate_bashate

# source "./tests/validate_shellcheck.sh"
# validate_shellcheck

# source "./tests/run_install.sh"
# run_install

# source "./tests/run_generate.sh"
# run_generate

echo "Finished"
