-- lua/plugins/telescope.lua
return {
  "https://github.com/nvim-telescope/telescope.nvim",
  config = function()
    local builtin = require("telescope.builtin")

    -- (Por padrão, a tecla <leader> no Neovim é a Barra de Espaço ou a Barra "/")
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Buscar Arquivos" })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Buscar Texto no Projeto" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Listar Buffers Abertos" })
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Buscar na Ajuda do Neovim" })

    -- Configurações visuais do Telescope (Opcional)
    require("telescope").setup({
      defaults = {
        prompt_prefix = "   ",
        selection_caret = "  ",
        entry_prefix = "  ",
        initial_mode = "insert",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
          },
        },
      },
    })
  end
}
