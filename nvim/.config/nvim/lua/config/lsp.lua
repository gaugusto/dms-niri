-- Detecta automaticamente e ativa todos os arquivos de LSP na pasta ~/.config/nvim/lsp/
local lsp_configs = {}
local lsp_files = vim.api.nvim_get_runtime_file("lsp/*.lua", true)

for _, filepath in ipairs(lsp_files) do
  -- Extrai apenas o nome do arquivo (ex: "lua_ls")
  local server_name = vim.fn.fnamemodify(filepath, ":t:r")
  table.insert(lsp_configs, server_name)
end

-- Ativa nativamente todos os LSPs encontrados
if #lsp_configs > 0 then
  vim.lsp.enable(lsp_configs)
end

-- Atalhos globais que serão aplicados assim que qualquer LSP se conectar ao buffer
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    local opts = { buffer = ev.buf }

    -- Definição (Ir para onde a função/variável foi criada)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)

    -- Documentação / Hover (Mostra detalhes do código sob o cursor)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

    -- Formatação de Código (Formata o arquivo atual usando o LSP)
    vim.keymap.set("n", "<space>f", function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})
