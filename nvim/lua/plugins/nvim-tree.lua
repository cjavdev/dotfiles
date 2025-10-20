return {
  {
    "nvim-tree/nvim-tree.lua",
    keys = {
      { "<leader>v", "<cmd>NvimTreeFindFileToggle<cr>", desc = "Toggle file tree and focus current file" },
    },
    config = function(_, opts)
      require("nvim-tree").setup(opts)
    end,
    opts = {
      disable_netrw = true,
      hijack_netrw = true,
      hijack_directories = {
        enable = false, -- Don't auto-open when running nvim .
      },
      filters = {
        dotfiles = false, -- Show hidden dot files
      },
      view = {
        width = 30,
        side = "left",
      },
      renderer = {
        group_empty = true,
        icons = {
          show = {
            file = false,
            folder = false,
            folder_arrow = true,
            git = false,
          },
        },
      },
      git = {
        enable = true,
        ignore = false,
      },
    },
  },
}