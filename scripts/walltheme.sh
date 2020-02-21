#!/bin/sh

# wal settings
# -n: Skips the wallpaper setting. Thats what feh is here for.
# -s: Skips changing colors in terminal emulators.
# -t: Skips changing colors in ttys.
wal -n -i "$@"
feh --bg-center "$(< "${HOME}/.cache/wal/wal")"
