-- lsp/lua_ls.lua
return {
  cmd = { "lua-language-server" },          -- O comando para rodar o LSP no seu sistema
  filetypes = { "lua" },                    -- Tipos de arquivo que ativam esse LSP
  root_markers = { ".luarc.json", ".git" }, -- Identifica a pasta raiz do projeto
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      diagnostics = {
        globals = { "vim" },                -- Evita avisos de que "vim" é uma variável global indefinida
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
    },
  },
}
