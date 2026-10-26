# Inicia o niri automaticamente ao fazer login no tty1
# -o interactive e -l evitam loop: sem -l, o niri-session reabre um shell de login
if [[ -o interactive && -z $WAYLAND_DISPLAY && -z $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec niri-session -l
fi
