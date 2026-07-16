-- lua/plugins/devicons.lua
return {
  "https://github.com/nvim-tree/nvim-web-devicons",
  config = function()
    require("nvim-web-devicons").setup({
      default = true,
    })
  end
}
