-- lua/plugins/lualine.lua
return {
  "https://github.com/nvim-lualine/lualine.nvim",
  config = function()
    -- Garante que o nvim-web-devicons seja carregado se você quiser ícones
    -- (Opcional: o lualine funciona sem ele, mas fica muito mais bonito com)
    pcall(require, "nvim-web-devicons")

    require("lualine").setup({
      options = {
        theme = "tokyonight", -- Integra perfeitamente com o tema que você já tem!
        component_separators = { left = "│", right = "│" },
        section_separators = { left = "", right = "" }, -- Ícones de transição bonitos (requer Nerd Font)
        globalstatus = true, -- Mantém apenas uma barra de status global na janela do Neovim
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { { "filename", path = 1 } }, -- Mostra o caminho relativo do arquivo
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    })
  end
}
