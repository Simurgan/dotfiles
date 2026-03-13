-- ~/.config/nvim/lua/plugins/lsp.lua
return {
  {
    "mason-org/mason.nvim",
    lazy = false,
    opts = {},
  },

  {
    "saghen/blink.cmp",
    lazy = false,
    version = "1.*",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    ---@module "blink.cmp"
    ---@type blink.cmp.Config
    opts = {
      keymap = { preset = "default" },

      appearance = {
        nerd_font_variant = "mono",
      },

      completion = {
        documentation = { auto_show = true, auto_show_delay_ms = 200 },
      },

      signature = {
        enabled = true,
      },

      cmdline = {
        keymap = { preset = "inherit" },
        completion = { menu = { auto_show = true } },
      },

      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },

      fuzzy = {
        implementation = "prefer_rust_with_warning",
      },
    },
    opts_extend = { "sources.default" },
  },

  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
      "saghen/blink.cmp",
    },
    config = function()
      -- Diagnostics UI
      vim.diagnostic.config({
        severity_sort = true,
        underline = true,
        update_in_insert = false,
        virtual_text = {
          spacing = 2,
          source = "if_many",
        },
        float = {
          border = "rounded",
          source = "if_many",
        },
      })

      -- Blink capabilities for LSP servers
      vim.lsp.config("*", {
        capabilities = require("blink.cmp").get_lsp_capabilities(),
      })

      -- Common keymaps
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(event)
          local buf = event.buf

          local map = function(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = buf, silent = true, desc = desc })
          end

          map("n", "gd", vim.lsp.buf.definition, "LSP: Go to definition")
          map("n", "gD", vim.lsp.buf.declaration, "LSP: Go to declaration")
          map("n", "gi", vim.lsp.buf.implementation, "LSP: Go to implementation")
          map("n", "gr", vim.lsp.buf.references, "LSP: See references")
          map("n", "gt", vim.lsp.buf.type_definition, "LSP: Go to type definition")
          map("n", "K", vim.lsp.buf.hover, "LSP: Hover documentation")
          map("n", "<leader>rn", vim.lsp.buf.rename, "LSP: Rename symbol")
          map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "LSP: See fix suggestions")
          map("n", "<leader>=", function()
            vim.lsp.buf.format({ async = true })
          end, "LSP: Format buffer")

          map("n", "<leader>dm", vim.diagnostic.open_float, "Diagnostics: Open diagnostic message")
          map("n", "<leader>ld", vim.diagnostic.setloclist, "Diagnostics: List diagnostics")
        end,
      })

      -- Lua: better Neovim awareness
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT",
              path = {
                "lua/?.lua",
                "lua/?/init.lua",
              },
            },
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              checkThirdParty = false,
              library = {
                vim.env.VIMRUNTIME,
              },
            },
            hint = {
              enable = true,
            },
            codeLens = {
              enable = true,
            },
          },
        },
      })

      -- Optional: Java note
      -- Plain jdtls through nvim-lspconfig is fine for diagnostics, completion,
      -- imports, formatting, gotos, and some code actions.
      -- If you later want a more Java-specific experience, add nvim-jdtls.
    end,
  },

  {
    "mason-org/mason-lspconfig.nvim",
    lazy = false,
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {
      automatic_enable = true,
      ensure_installed = {
        "lua_ls",    -- lua
        -- "nil_ls",    -- nix
        "clangd",    -- c
        "jdtls",     -- java
        "gopls",     -- go
        "pyright",   -- python
        "bashls",    -- bash/sh
        "fish_lsp",  -- fish
        "dockerls",  -- dockerfile
        "yamlls",    -- yaml
        "jsonls",    -- json
        "taplo",     -- toml
        "ts_ls",     -- javascript/typescript
        "html",      -- html
        "cssls",     -- css/scss/less
        "marksman",  -- markdown
        "texlab",    -- latex
        "sqlls",     -- sql
      },
    },
  },
}
