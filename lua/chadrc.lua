-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "github_dark",

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}

M.nvdash = { load_on_startup = true }
M.lsp = { signature = false }
M.ui = {
	tabufline = {
		lazyload = false,
	},
	statusline = {
		order = {
      "mode", "file", "git", "%=", "lsp_msg", "%=", "diagnostics", "lsp", "copilot_status", "cwd", "cursor",
		},
		modules = {
      lsp = function()
        if rawget(vim, "lsp") then
          for _, client in ipairs(vim.lsp.get_clients()) do
            if client.name ~= "copilot" then
              if client.attached_buffers[vim.api.nvim_get_current_buf()] then
                return "%#St_Lsp#" .. (vim.o.columns > 100 and "   LSP ~ " .. client.name .. " ") or "   LSP "
              end
            end
          end
        end
        return ""
      end,

      copilot_status = function()
        local c_ok, c = pcall(require, "copilot.client")
        local s_ok, s = pcall(require, "copilot.status")

        if not c_ok or not s_ok then
          return ""
        end

        local is_current_buffer_attached = function()
          return c.buf_is_attached(vim.api.nvim_get_current_buf())
        end

        if c.is_disabled() or not is_current_buffer_attached() then
          return "%#St_lspError#" .. "    "
        end

        local data = s.data.status
        if data == 'InProgress' then
          return "%#St_LspInfo#" .. "    "
        elseif data == 'Warning' then
          return "%#St_lspWarning#" .. "    "
        elseif data == 'Connected' then
          return "%#St_LspInfo#" .. "    "
        end

        return "%#St_LspInfo#" .. "    "
      end,
		},
	},
}

-- read :h nvui

return M
