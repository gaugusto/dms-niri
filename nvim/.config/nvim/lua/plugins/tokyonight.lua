return {
  "https://github.com/folke/tokyonight.nvim",
  config = function()
    require("tokyonight").setup({
      style = "night",
      transparent = false,
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
      },
    })
    vim.cmd([[colorscheme tokyonight]])
  end
}
