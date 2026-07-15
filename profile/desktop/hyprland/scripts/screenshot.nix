{ ... }:

{
  home.file.".local/bin/screenshot" = {
    executable = true;

    text = ''
      #!/usr/bin/env bash
      set -euo pipefail

      DIR="$HOME/Pictures/Screenshots"
      mkdir -p "$DIR"

      APP="$(
        hyprctl activewindow -j \
          | jq -r '.class // .initialClass // "unknown"' \
          | tr '/:*?"<>| ' '_'
      )"

      FILE="$DIR/''${APP}-$(date +'%Y-%m-%d_%H-%M-%S').png"

      GEOMETRY="$(slurp)" || exit 0

      grim -g "$GEOMETRY" "$FILE"
      wl-copy < "$FILE"

      notify-send \
        -i camera-photo \
        "Скриншот сохранён" \
        "$FILE"
    '';
  };
}
