-- Lista apenas com as strings de origens dos plugins (o que o Neovim espera)
local pack_specs = {}

-- Dicionário para guardarmos as funções de configuração pós-carregamento
local configs = {}

-- Lista com o nome dos arquivos em lua/plugins/
local plugins_to_load = {
  "tokyonight",
  "devicons",
  "lualine",
  "plenary",
  "telescope",
  "highlight-colors",
}

for _, name in ipairs(plugins_to_load) do
  local spec = require("plugins." .. name)

  -- O primeiro elemento (índice 1) é a URL do plugin
  local plugin_url = spec[1]

  if plugin_url then
    table.insert(pack_specs, plugin_url)

    -- Se houver uma função de configuração, guarda ela usando a URL como chave
    if type(spec.config) == "function" then
      configs[plugin_url] = spec.config
    end
  end
end

-- 1. Registra e instala os plugins de forma nativa passando apenas a lista de URLs
vim.pack.add(pack_specs)

-- 2. Executa as configurações de cada plugin após o carregamento bem-sucedido
for _, config_fn in pairs(configs) do
  config_fn()
end

