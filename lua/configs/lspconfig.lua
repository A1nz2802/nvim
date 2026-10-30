require("nvchad.configs.lspconfig").defaults()

vim.filetype.add {
  extension = {
    tf = "terraform",
    tfvars = "terraform-vars",
  },
  filename = {
    ["compose.yaml"] = "yaml.docker-compose",
    ["compose.yml"] = "yaml.docker-compose",
    ["docker-compose.yaml"] = "yaml.docker-compose",
    ["docker-compose.yml"] = "yaml.docker-compose",
    ["inventory.yaml"] = "yaml.ansible",
    ["inventory.yml"] = "yaml.ansible",
    ["playbook.yaml"] = "yaml.ansible",
    ["playbook.yml"] = "yaml.ansible",
    ["site.yaml"] = "yaml.ansible",
    ["site.yml"] = "yaml.ansible",
  },
  pattern = {
    [".*/playbooks/.*%.ya?ml"] = "yaml.ansible",
    [".*/tasks/.*%.ya?ml"] = "yaml.ansible",
    [".*/handlers/.*%.ya?ml"] = "yaml.ansible",
    [".*/roles/.*/tasks/.*%.ya?ml"] = "yaml.ansible",
    [".*/roles/.*/handlers/.*%.ya?ml"] = "yaml.ansible",
    [".*/roles/.*/defaults/.*%.ya?ml"] = "yaml.ansible",
    [".*/roles/.*/vars/.*%.ya?ml"] = "yaml.ansible",
    [".*/roles/.*/meta/.*%.ya?ml"] = "yaml.ansible",
    [".*/group_vars/.*%.ya?ml"] = "yaml.ansible",
    [".*/host_vars/.*%.ya?ml"] = "yaml.ansible",
    [".*/[^/]*playbook[^/]*%.ya?ml"] = "yaml.ansible",
  },
}

local servers = {
  "bashls",
  "basedpyright",
  "ansiblels",
  "clangd",
  "cssls",
  "docker_language_server",
  "gopls",
  "html",
  "jsonls",
  "ruff",
  "terraformls",
  "ts_ls",
  "yamlls",
}

vim.lsp.config("basedpyright", {
  settings = {
    basedpyright = {
      disableOrganizeImports = true,
      analysis = {
        diagnosticMode = "workspace",
        typeCheckingMode = "strict",
      },
    },
  },
})

vim.lsp.config("ruff", {
  init_options = {
    settings = {
      configurationPreference = "filesystemFirst",
    },
  },
})

vim.lsp.config("ansiblels", {
  settings = {
    ansible = {
      ansible = { path = "ansible" },
      validation = {
        enabled = true,
        lint = { enabled = true, path = "ansible-lint" },
      },
    },
  },
})

vim.lsp.config("yamlls", {
  filetypes = { "yaml", "yaml.docker-compose", "yaml.gitlab", "yaml.helm-values", "yaml.ansible" },
  settings = {
    yaml = {
      format = { enable = true },
      schemaStore = { enable = true, url = "" },
      schemas = {
        ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
        [vim.fn.stdpath("config") .. "/ansible-inventory.schema.json"] = {
          "/**/inventory.yml",
          "/**/inventory.yaml",
        },
      },
    },
  },
})

vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
