return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "saghen/blink.cmp",
    "mason-org/mason.nvim",
    "mason-org/mason-lspconfig.nvim",
    "b0o/schemastore.nvim",
  },
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("mason").setup()

    require("mason-lspconfig").setup({
      ensure_installed = {
        "basedpyright",
        "bashls",
        "dockerls",
        "gopls",
        "helm_ls",
        "jsonls",
        "lua_ls",
        "terraformls",
        "yamlls",
      },
      automatic_enable = true,
    })

    local servers = {
      bashls = {
        filetypes = { "bash", "sh", "zsh" },
      },

      gopls = {
        settings = {
          gopls = {
            analyses = { unusedparams = true },
            staticcheck = true,
          },
        },
      },

      helm_ls = {
        settings = {
          ["helm-ls"] = {
            yamlls = { path = "yaml-language-server" },
          },
        },
      },

      jsonls = {
        settings = {
          json = {
            schemas = require("schemastore").json.schemas(),
            validate = { enable = true },
          },
        },
      },

      lua_ls = {
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            workspace = { checkThirdParty = false },
          },
        },
      },

      yamlls = {
        on_attach = function(client, bufnr)
          local bufname = vim.api.nvim_buf_get_name(bufnr)
          if bufname:match("%.tftpl$") then
            vim.lsp.buf_detach_client(bufnr, client.id)
          end
        end,
        settings = {
          yaml = {
            schemaStore = { enable = false, url = "" },
            schemas = require("schemastore").yaml.schemas(),
            validate = true,
            hover = true,
            completion = true,
          },
        },
      },
    }

    vim.lsp.config("*", {
      capabilities = require("blink.cmp").get_lsp_capabilities(),
    })

    for name, cfg in pairs(servers) do
      vim.lsp.config(name, cfg)
    end

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
      callback = function(ev)
        local map = function(keys, func, desc)
          vim.keymap.set("n", keys, func, { buffer = ev.buf, desc = "LSP: " .. desc })
        end

        -- diagnostic
        map("<leader>ld", function()
          vim.diagnostic.open_float()
        end, "Show Diagnostic")
        map("[d", function()
          vim.diagnostic.jump({ count = -1 })
        end, "Previous Diagnostic")
        map("]d", function()
          vim.diagnostic.jump({ count = 1 })
        end, "Next Diagnostic")

        -- lsp
        map("<leader>la", vim.lsp.buf.code_action, "Code Actions")
        map("<leader>lr", vim.lsp.buf.rename, "Rename")
        map("K", function()
          vim.lsp.buf.hover({ border = "rounded" })
        end, "Hover")
      end,
    })

    vim.diagnostic.config({
      float = {
        border = "rounded",
        source = true,
      },
      severity_sort = true,
      signs = true,
      underline = true,
      update_in_insert = false,
      virtual_text = true,
    })
  end,
}
