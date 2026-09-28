return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  opts = {
    formatters_by_ft = {
      go = { "gofmt" },
      javascript = { "prettier" },
      json = { "prettier" },
      lua = { "stylua" },
      markdown = { "prettier_md" },
      python = { "ruff_format", "ruff_organize_imports" },
      sh = { "shfmt" },
      terraform = { "terraform_fmt" },
      typescript = { "prettier" },
      yaml = { "prettier" },
      zsh = { "shfmt" },
    },
    formatters = {
      prettier = {
        options = {
          ft_parsers = {
            json = "json",
            yaml = "yaml",
          },
        },
      },
      prettier_md = {
        inherit = "prettier",
        prepend_args = {
          "--tab-width=4",
        },
      },
      stylua = {
        args = {
          "--indent-type=Spaces",
          "--indent-width=2",
          "--respect-ignores",
          "--stdin-filepath",
          "$FILENAME",
          "-",
        },
      },
    },
    default_format_opts = {
      lsp_format = "fallback",
    },
    format_on_save = function(bufnr)
      local bufname = vim.api.nvim_buf_get_name(bufnr)
      if bufname:match("%.j2$") then
        return
      end

      return {
        timeout_ms = 500,
        lsp_format = "fallback",
      }
    end,
  },
}
