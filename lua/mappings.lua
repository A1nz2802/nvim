require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>rw", function()
  local word = vim.fn.expand "<cword>"
  if word == "" then
    return
  end

  local bufnr = vim.api.nvim_get_current_buf()
  vim.ui.input({ prompt = ("Replace '%s' with: "):format(word) }, function(replacement)
    if replacement == nil or not vim.api.nvim_buf_is_valid(bufnr) then
      return
    end

    local pattern = "\\<" .. vim.fn.escape(word, [[\/.^$~[]*]]) .. "\\>"
    local value = vim.fn.escape(replacement, [[\/&~]])
    vim.api.nvim_buf_call(bufnr, function()
      vim.cmd("%s/" .. pattern .. "/" .. value .. "/g")
    end)
  end)
end, { desc = "Replace word in current buffer" })

map("n", "<leader>dd", function()
  vim.cmd.RustLsp "debuggables"
end, { desc = "DAP Rust debuggables" })
map("n", "<leader>db", function()
  require("dap").toggle_breakpoint()
end, { desc = "DAP toggle breakpoint" })
map("n", "<leader>dc", function()
  require("dap").continue()
end, { desc = "DAP continue" })
map("n", "<leader>di", function()
  require("dap").step_into()
end, { desc = "DAP step into" })
map("n", "<leader>do", function()
  require("dap").step_over()
end, { desc = "DAP step over" })
map("n", "<leader>dO", function()
  require("dap").step_out()
end, { desc = "DAP step out" })
map("n", "<leader>dt", function()
  require("dap").terminate()
end, { desc = "DAP terminate" })
map("n", "<leader>du", function()
  require("dapui").toggle()
end, { desc = "DAP toggle UI" })
map("n", "<leader>dr", function()
  require("dap").repl.toggle()
end, { desc = "DAP toggle REPL" })
map({ "n", "x" }, "<leader>de", function()
  require("dapui").eval()
end, { desc = "DAP evaluate" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
