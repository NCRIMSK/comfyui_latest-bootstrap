#!/bin/bash
set -e
COMFY_TAG="v0.3.77"
COMFY_DIR="$HOME/ComfyUI"

rm -rf "$COMFY_DIR"
git clone https://github.com/comfyanonymous/ComfyUI.git "$COMFY_DIR"
cd "$COMFY_DIR"
git checkout "$COMFY_TAG"

python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt

mkdir -p custom_nodes
cd custom_nodes
while read -r repo; do
  [ -z "$repo" ] && continue
  git clone "$repo"
done < "$HOME/comfy-bootstrap/custom_nodes.txt"
