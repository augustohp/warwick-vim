-- personalization.lua
-- Customizing experience on neovim


vim.g.editorconfig = true
vim.cmd.colorscheme "catppuccin"

-- Telescope (Fuzzy finder)
local tc = require("telescope.builtin")
vim.keymap.set('n', '<C-p>', tc.find_files, {})
vim.keymap.set('n', '<leader>gb', tc.buffers, {})
vim.keymap.set('n', '<leader>gg', tc.live_grep, {})
