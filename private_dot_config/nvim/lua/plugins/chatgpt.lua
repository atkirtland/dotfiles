return {
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    enabled = false,
    config = function()
      require("chatgpt").setup({
        api_key_cmd = "gpg --quiet --batch --decrypt " .. vim.fn.expand("$HOME") .. "/.secrets/secret.txt.gpg",
      })
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "folke/trouble.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },
}
