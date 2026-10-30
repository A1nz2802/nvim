return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      local parsers = {
        "bash",
        "c",
        "cpp",
        "css",
        "dockerfile",
        "go",
        "gomod",
        "gosum",
        "gowork",
        "html",
        "hcl",
        "javascript",
        "json",
        "lua",
        "luadoc",
        "markdown",
        "markdown_inline",
        "printf",
        "python",
        "rust",
        "tsx",
        "terraform",
        "typescript",
        "vim",
        "vimdoc",
        "yaml",
      }
      require("nvim-treesitter").setup {
        install_dir = vim.fn.stdpath "data" .. "/site",
      }

      vim.api.nvim_create_autocmd("FileType", {
        callback = function(args)
          pcall(vim.treesitter.start, args.buf)
        end,
      })

      require("nvim-treesitter").install(parsers):wait(300000)
    end,
  },

  {
    "vyfor/cord.nvim",
    build = ":Cord update",
    lazy = false,
  },

  {
    "karb94/neoscroll.nvim",
    lazy = false,
    opts = {
      hide_cursor = true,
      stop_eof = true,
      respect_scrolloff = false,
      cursor_scrolls_alone = true,
      duration_multiplier = 0.5,
      easing = "linear",
      performance_mode = false,
      ignored_events = { "WinScrolled", "CursorMoved" },
    },
  },

  {
    "mrcjkb/rustaceanvim",
    version = "^9",
    lazy = false,
  },

  {
    "mfussenegger/nvim-dap",
    lazy = false,
    dependencies = {
      "nvim-neotest/nvim-nio",
      "rcarriga/nvim-dap-ui",
    },
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"

      dapui.setup()
      dap.defaults.fallback.switchbuf = "useopen,split"

      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
    end,
  },

  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      local debugpy = vim.fn.stdpath("data") .. "/mason/bin/debugpy-adapter"
      local dap_python = require "dap-python"

      dap_python.setup(debugpy)
      dap_python.test_runner = "pytest"
    end,
    keys = {
      {
        "<leader>dm",
        function()
          require("dap-python").test_method()
        end,
        desc = "DAP Python: Debug test method",
        ft = "python",
      },
      {
        "<leader>dM",
        function()
          require("dap-python").test_class()
        end,
        desc = "DAP Python: Debug test class",
        ft = "python",
      },
    },
  },

  {
    "nvim-neotest/neotest",
    ft = "python",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-neotest/nvim-nio",
      "nvim-neotest/neotest-python",
    },
    config = function()
      require("neotest").setup {
        adapters = {
          require("neotest-python") {
            dap = { justMyCode = false },
            runner = "pytest",
          },
        },
      }
    end,
    keys = {
      {
        "<leader>tn",
        function()
          require("neotest").run.run()
        end,
        desc = "Tests: Run nearest",
        ft = "python",
      },
      {
        "<leader>tf",
        function()
          require("neotest").run.run(vim.fn.expand "%")
        end,
        desc = "Tests: Run file",
        ft = "python",
      },
      {
        "<leader>td",
        function()
          require("neotest").run.run { strategy = "dap" }
        end,
        desc = "Tests: Debug nearest",
        ft = "python",
      },
      {
        "<leader>ts",
        function()
          require("neotest").run.stop()
        end,
        desc = "Tests: Stop run",
        ft = "python",
      },
    },
  },

  {
    "ray-x/go.nvim",
    dependencies = {
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    ft = { "go", "gomod" },
    opts = {
      lsp_cfg = false,
    },
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {},
  },

  {
    "iamcco/markdown-preview.nvim",
    ft = { "markdown" },
    cmd = { "MarkdownPreview", "MarkdownPreviewStop", "MarkdownPreviewToggle" },
    build = "cd app && npx --yes yarn install",
    keys = {
      {
        "<leader>mp",
        "<cmd>MarkdownPreviewToggle<cr>",
        desc = "Markdown: Toggle browser preview",
      },
    },
  },

  {
    "HakonHarnes/img-clip.nvim",
    ft = { "markdown" },
    keys = {
      {
        "<leader>mi",
        function()
          vim.ui.input({
            prompt = "Image folder relative to this Markdown file: ",
            default = "images",
          }, function(dir_path)
            if dir_path == nil then
              return
            end

            require("img-clip").paste_image {
              dir_path = dir_path ~= "" and dir_path or "images",
              relative_to_current_file = true,
              prompt_for_file_name = true,
              show_dir_path_in_prompt = false,
            }
          end)
        end,
        desc = "Markdown: Paste clipboard image",
      },
    },
    opts = {
      default = {
        extension = "png",
        relative_to_current_file = true,
        use_absolute_path = false,
        prompt_for_file_name = true,
      },
    },
  },

  {
    "3rd/image.nvim",
    branch = "master",
    lazy = false,
    build = false,
    opts = {
      backend = "sixel",
      processor = "magick_cli",
      integrations = {
        markdown = {
          enabled = true,
          filetypes = { "markdown" },
        },
      },
      hijack_file_patterns = {
        "*.png",
        "*.jpg",
        "*.jpeg",
        "*.gif",
        "*.webp",
        "*.avif",
        "*.svg",
        "*.pdf",
      },
    },
  },
}
