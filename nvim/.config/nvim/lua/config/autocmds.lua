vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*bookmarks",
  callback = function()
    -- Salva a posição atual do cursor para não perder o foco
    local cursor_pos = vim.api.nvim_win_get_cursor(0)

    -- Executa a ordenação da linha 1 até o final do arquivo
    vim.cmd("1,$sort i")

    -- Restaura a posição do cursor
    pcall(vim.api.nvim_win_get_cursor, 0, cursor_pos)
  end,
})
