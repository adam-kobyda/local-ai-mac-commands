#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
TARGET_DIR="$HOME/.local/bin"

# Add new scripts here as "subdir/script-name"
SCRIPTS=(
  "last-downloaded/last-downloaded"
)

echo "The following commands will be installed to $TARGET_DIR:"
for s in "${SCRIPTS[@]}"; do
  echo "  $(basename "$s")"
done
echo ""
read -r -p "Proceed? [Y/n] " confirm
confirm="${confirm:-Y}"
if [[ ! "$confirm" =~ ^[Yy]$ ]]; then
  echo "Aborted."
  exit 0
fi

mkdir -p "$TARGET_DIR"
for s in "${SCRIPTS[@]}"; do
  name="$(basename "$s")"
  cp "$REPO_DIR/$s" "$TARGET_DIR/$name"
  chmod +x "$TARGET_DIR/$name"
  echo "  Installed: $name → $TARGET_DIR/$name"
done

echo ""
if ! printf '%s\n' "${PATH//:/$'\n'}" | grep -qx "$TARGET_DIR"; then
  echo "$TARGET_DIR is not on your PATH."
  read -r -p "Add it to ~/.zshrc now? [Y/n] " add_path
  add_path="${add_path:-Y}"
  if [[ "$add_path" =~ ^[Yy]$ ]]; then
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$HOME/.zshrc"
    echo "Added. Run: source ~/.zshrc"
  else
    echo "To add manually:"
    echo "  echo 'export PATH=\"\$HOME/.local/bin:\$PATH\"' >> ~/.zshrc && source ~/.zshrc"
  fi
fi

echo ""
echo "Done."
