require "nvchad.autocmds"

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "docker-compose*.yml", "compose*.yml" },
  callback = function()
    vim.bo.filetype = "yaml.docker-compose"
  end,
})
