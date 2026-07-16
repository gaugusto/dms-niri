-- lua/plugins/highlight-colors.lua
return {
  "https://github.com/brenoprata10/nvim-highlight-colors",
  config = function()
    require("nvim-highlight-colors").setup({
      -- Método de renderização das cores. Opções disponíveis:
      -- 'background' -> Pinta o fundo do código com a cor correspondente
      -- 'foreground' -> Altera apenas a cor do texto da cor descrita
      -- 'virtual'    -> Cria um pequeno quadrado colorido com texto virtual ao lado do código
      render = "background",

      -- Habilita o realce de nomes de cores comuns em inglês (ex: 'red', 'blue', 'green')
      enable_named_colors = true,

      -- Habilita o realce para classes de cores do Tailwind CSS
      enable_tailwind = true,

      -- Habilita o realce de cores no formato CSS (ex: rgb, hsl, etc.)
      enable_css_variables = true,
      
      -- Exclui tipos de arquivo onde você não quer que as cores fiquem piscando na tela
      exclude_filetypes = { "lazy", "mason", "help" },
    })
  end
}
