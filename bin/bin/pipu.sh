#!/bin/bash

# update all outdated pip packages at once
echo "Updating all pip packages"
pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U

# update pipx
echo "Updating pipx"
python3 -m pip install --user -U pipx
