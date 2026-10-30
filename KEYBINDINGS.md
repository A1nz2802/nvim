# Keybindings

`<leader>` is Space. This config adds NvChad defaults and shared LSP mappings, plus a small number of tool-specific shortcuts.

## General

| Key | Action |
| --- | --- |
| `;` | Enter command-line mode |
| `jk` in insert mode | Return to normal mode |
| `<leader>rw` | Replace the word under the cursor throughout the current buffer |
| `<leader>mi` | Save a clipboard image beside the Markdown file and insert its link; prompts for folder and filename |
| `<C-s>` | Save file |
| `<leader>fm` | Format current file |
| `<leader>/` | Toggle comment on line or selection |
| `<C-n>` | Toggle file explorer |
| `<leader>e` | Focus file explorer |
| `<leader>ff` | Find files |
| `<leader>fw` | Search text in project |
| `<leader>fb` | Find open buffers |
| `<leader>n` | Toggle line numbers |
| `<leader>rn` | Toggle relative line numbers |
| `<leader>h` / `<leader>v` | Open horizontal / vertical terminal |
| `<A-i>` | Toggle floating terminal |

## Completion

| Key | Action |
| --- | --- |
| `<C-Space>` | Trigger completion suggestions |
| `<C-n>` / `<C-p>` | Select next / previous suggestion |
| `<CR>` | Confirm the selected suggestion |

## LSP And Diagnostics

These mappings work in buffers attached to a language server: Python, Rust, Go, C/C++, Bash, CSS, Docker, HTML, JSON, TypeScript, Terraform, and YAML.

| Key | Action |
| --- | --- |
| `K` | Show hover documentation |
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `<leader>D` | Go to type definition |
| `<leader>ra` | Rename symbol with NvChad's renamer |
| `<leader>wa` / `<leader>wr` | Add / remove workspace folder |
| `<leader>wl` | List workspace folders |
| `<leader>ds` | Open diagnostics location list |
| `[d` / `]d` | Jump to previous / next diagnostic |
| `grn` | Rename symbol (Neovim default) |
| `grr` | Find references (Neovim default) |
| `gra` | Code action (Neovim default) |
| `gri` | Go to implementation (Neovim default) |
| `grt` | Go to type definition (Neovim default) |

Formatting is also configured to run automatically on save. C/C++, TypeScript/JavaScript, YAML, and other languages use the same LSP and format mappings; they do not currently have additional custom language-specific maps.

## Debugging

| Key | Action |
| --- | --- |
| `<leader>db` | Toggle breakpoint |
| `<leader>dc` | Continue |
| `<leader>di` | Step into |
| `<leader>do` | Step over |
| `<leader>dO` | Step out |
| `<leader>dt` | Terminate debugging |
| `<leader>du` | Toggle DAP UI |
| `<leader>dr` | Toggle DAP REPL |
| `<leader>de` | Evaluate selection or word |
| `<leader>dd` | Show Rust debuggables |

## Python Tests

Available in Python buffers. Neotest uses pytest; debugging uses `nvim-dap-python` and `debugpy`.

| Key | Action |
| --- | --- |
| `<leader>tn` | Run nearest test |
| `<leader>tf` | Run tests in current file |
| `<leader>td` | Debug nearest test |
| `<leader>ts` | Stop test run |
| `<leader>dm` | Debug nearest test method |
| `<leader>dM` | Debug test class |

## Markdown

| Key | Action |
| --- | --- |
| `<leader>mp` | Toggle browser preview for current Markdown file |
