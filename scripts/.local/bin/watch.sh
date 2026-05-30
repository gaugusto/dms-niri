#!/usr/bin/env bash

# 1. Verifica dependências
if ! command -v cliphist &> /dev/null || ! command -v walker &> /dev/null; then
  notify-send "Erro" "cliphist ou walker não estão instalados."
  exit 1
fi

# 2. Obtém a lista de links (Removendo duplicatas com uniq)
LINKS=$(cliphist list | awk '$2 ~ /youtube\.com|youtu\.be|twitch\.tv/ {print $2}' | uniq)

# 3. Verifica se a lista está vazia
if [ -z "$LINKS" ]; then
  notify-send "YouTube-MPV" "Nenhum link encontrado no histórico." -u low
  exit 1
fi

# 4. Abre o Walker para seleção
ESCOLHA=$(echo "$LINKS" | walker -d)

# 5. Se o usuário não cancelou (Esc), executa o MPV
if [ -n "$ESCOLHA" ]; then
  notify-send "MPV" "Abrindo: $ESCOLHA" -u low
  mpv-yt "$ESCOLHA"
fi

