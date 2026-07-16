-- lsp/pyright.lua
return {
  -- Comando executável do Pyright no seu sistema operacional
  cmd = { "pyright-langserver", "--stdio" },
  
  -- Tipos de arquivo que ativarão este LSP
  filetypes = { "python" },
  
  -- Marcadores usados para descobrir a raiz do projeto Python
  root_markers = {
    "pyproject.toml",
    "setup.py",
    "setup.cfg",
    "requirements.txt",
    ".git",
  },
  
  -- Configurações específicas do servidor do Pyright
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        typeCheckingMode = "basic", -- Pode ser "off", "basic" ou "strict"
        diagnosticMode = "workspace",
      },
    },
  },
}
