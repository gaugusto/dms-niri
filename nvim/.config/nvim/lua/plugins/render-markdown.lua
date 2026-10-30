-- lua/plugins/render-markdown.lua
return {
  "https://github.com/MeanderingProgrammer/render-markdown.nvim",
  config = function()
    -- Usa os parsers de markdown que já vêm embutidos no Neovim (markdown e markdown_inline)
    require("render-markdown").setup({
      file_types = { "markdown" },
      -- Desativados porque esses parsers não estão instalados (evita avisos no :checkhealth)
      html = { enabled = false },
      latex = { enabled = false },
      yaml = { enabled = false },
    })

    -- Liga/desliga a renderização do markdown no buffer atual
    vim.keymap.set("n", "<leader>mr", "<cmd>RenderMarkdown toggle<cr>", { desc = "Alternar Render Markdown" })
  end
}
