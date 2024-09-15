-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.clipboard = "unnamed,unnamedplus" -- unnamed corresponds to X11 PRIMARY clipboard (middle mouse, last selected text), + corresponds to CLIPBOARD, <C-v> <C-p>
vim.g.vimtex_syntax_conceal_disable = 1
vim.opt.wrap = true

if vim.g.neovide then
  vim.keymap.set({ "n", "v" }, "<C-+>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>")
  vim.keymap.set({ "n", "v" }, "<C-->", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>")
  vim.keymap.set({ "n", "v" }, "<C-0>", ":lua vim.g.neovide_scale_factor = 1<CR>")
end

-- for molten.nvim
vim.g.python3_host_prog = vim.fn.expand("~/miniconda3/bin/python")

-- to fix error
vim.g.lazyvim_python_ruff = "ruff_lsp"
