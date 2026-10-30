# Neovim Configuration

A personal Neovim setup built on [NvChad](https://github.com/NvChad/NvChad), with plugins managed by `lazy.nvim`. It uses the OneDark colorscheme and Space as the leader key.

## Language Tooling

| Language/area | Language support and tools |
| --- | --- |
| Python | BasedPyright with strict workspace checking; Ruff for diagnostics, import sorting, and formatting; `debugpy` with `nvim-dap`; Neotest with pytest; `uv` for project environments and dependencies |
| Rust | `rustaceanvim`/rust-analyzer, `rustfmt`, and `codelldb` |
| Go | `gopls`, `go.nvim`, and `gofmt` |
| C/C++ | `clangd` and `clang-format`; `clang` and `gcc` are available on this machine |
| TypeScript/JavaScript | TypeScript language server, Treesitter, and Prettier |
| Ansible | Ansible Language Server for playbooks, roles, and `inventory.yml`; recursive schema completion for inventory groups; `ansible-lint`, `yamllint`, and Ansible CLI installed with uv |
| Other formats | Bash, CSS, Docker, HTML, JSON, Terraform, and YAML language servers and/or formatters |

Language servers, debuggers, and development tools are installed with Mason where available. `clangd` and `clang-format` use the system executables. `uv` is installed separately from Mason.

## Other Features

- Completion and common editor mappings from NvChad.
- Format on save through Conform.
- Treesitter parsing for the configured languages.
- Debugging through `nvim-dap` and `nvim-dap-ui`.
- Markdown rendering in the editor and an HTML preview in the browser.
- Paste clipboard images into Markdown; choose a folder and filename, then the image link is inserted automatically.
- Inline image display in Foot through `image.nvim`'s Sixel backend.

## Setup

Requires Neovim 0.12.0 or newer. Tree-sitter parser installation needs `tree-sitter-cli` 0.26.1+, a C compiler, `tar`, and `curl`. Place this repository at `~/.config/nvim` and start Neovim; the config bootstraps `lazy.nvim` and installs its plugins. Node.js/npm are required to build the Markdown browser preview. Clipboard image pasting on Wayland uses `wl-clipboard`; inline rendering uses a Sixel-capable terminal and ImageMagick with Sixel support. Install `uv` separately from [its installation guide](https://docs.astral.sh/uv/getting-started/installation/).

See [KEYBINDINGS.md](KEYBINDINGS.md) for custom shortcuts and common NvChad/LSP mappings.
