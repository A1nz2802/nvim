local lspconfig = require "lspconfig"

require("nvchad.configs.lspconfig").defaults()

local servers = { 
  "html", 
  "cssls",
  "jsonls",
  "prismals", 
  
  "docker_compose_language_service",
  "yamlls",
  "nginx_language_server",
  "dockerls",
  
  "bashls",
  "lua_ls",
  "ts_ls",
  "gopls",
  "pyright",
  "rust_analyzer",

}

vim.lsp.config['yamlls'] = {
  filetypes = { 'yml' },
}

vim.lsp.enable(servers)
-- read :h vim.lsp.config for changing options of lsp servers 