#!/usr/bin/env bash

selected_pdfs=$(ls *.pdf 2>/dev/null | fzf -m --ansi --header "Selecione os PDFs com TAB (a ordem importa!)" \
    --preview "pdftotext -l 1 {} - 2>/dev/null | head -n 20")

if [ -z "$selected_pdfs" ]; then
    echo "Nenhum arquivo selecionado. Saindo..."
    exit 0
fi

echo -n "Digite o nome do arquivo de saída (ex: resultado.pdf): "
read -r output_name

# Garante que o nome termine com .pdf
[[ "$output_name" != *.pdf ]] && output_name="${output_name}.pdf"


# O pdfunite tem uma sintaxe: pdfunite [opções] <PDF-fonte1>...<PDF-fonteN> <PDF-destino>
# Como o xargs coloca o nome de saída no final, usamos o comando abaixo:
echo "$selected_pdfs" | tr '\n' '\0' | xargs -0 pdfunite -- "$output_name" 2>/dev/null

files_array=()
while IFS= read -r line; do
    files_array+=("$line")
done <<< "$selected_pdfs"

pdfunite "${files_array[@]}" "$output_name"

echo "Sucesso! Arquivo '$output_name' criado com os seguintes PDFs:"
echo "$selected_pdfs"
