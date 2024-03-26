-- change trouble config
return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    -- opts will be merged with the parent spec
    opts = {
      -- close_if_last_window = true,
      filesystem = {
        filtered_items = {
          visible = true, -- This is what you want: If you set this to `true`, all "hide" just mean "dimmed out"
          hide_dotfiles = false,
          hide_gitignored = true,
        },
      },
    },
  },
  {
    "akinsho/bufferline.nvim",
    keys = {
      { "<leader>bx", "<cmd>BufferLineTogglePin<cr>" },
      { "<leader>bX", "<cmd>BufferLineGroupClose ungrouped<cr>" },
      { "<leader>bo", "<cmd>BufferLineCloseOthers<cr>" },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      desc = "a",
    },
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        markdown = {},
      },
    },
  },
}
