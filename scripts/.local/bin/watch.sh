#!/usr/bin/env bash

# 2. Obtém a lista de links (Removendo duplicatas com uniq)
LINKS=$(dms cl history --json | jq -r '.[] | select(.preview | test("youtube\\.com|twitch\\.tv|youtu\\.be|kick\\.com"; "i")) | .preview' | uniq)

# 3. Verifica se a lista está vazia
if [ -z "$LINKS" ]; then
  notify-send "YouTube-MPV" "Nenhum link encontrado no histórico." -u low
  exit 1
fi

# 4. Abre o Walker para seleção
ESCOLHA=$(echo "$LINKS" | rofi -dmenu)

# 5. Se o usuário não cancelou (Esc), executa o MPV
if [ -n "$ESCOLHA" ]; then
  notify-send "MPV" "Abrindo: $ESCOLHA" -u low
  mpv "$ESCOLHA"
fi

