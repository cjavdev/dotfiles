return {
  {
    "stevearc/conform.nvim",
    keys = {
      { "<leader>f", function() require("conform").format({ async = true, lsp_fallback = true }) end, desc = "Format file" },
    },
    opts = {
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        json = { "prettier" },
        css = { "prettier" },
        scss = { "prettier" },
        html = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        lua = { "stylua" },
        python = { "black" },
        go = { "gofmt" },
        rust = { "rustfmt" },
      },
    },
    init = function()
      -- If you want to disable format on save, you can set this to false
      vim.g.disable_autoformat = false
      
      -- Create a command to toggle format on save
      vim.api.nvim_create_user_command("FormatToggle", function()
        vim.g.disable_autoformat = not vim.g.disable_autoformat
        print("Format on save " .. (vim.g.disable_autoformat and "disabled" or "enabled"))
      end, { desc = "Toggle format on save" })
    end,
  },
}