-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "onedark",

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

M.mason = {
  pkgs = {
    "ansible-language-server",
    "ansible-lint",
    "bash-language-server",
    "basedpyright",
    "codelldb",
    "css-lsp",
    "docker-language-server",
    "dockerfmt",
    "debugpy",
    "gopls",
    "html-lsp",
    "json-lsp",
    "prettier",
    "ruff",
    "shfmt",
    "terraform-ls",
    "typescript-language-server",
    "yaml-language-server",
    "yamllint",
  },
  skip = { "clangd", "rust-analyzer" },
}

-- M.nvdash = { load_on_startup = true }
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
-- }

return M
