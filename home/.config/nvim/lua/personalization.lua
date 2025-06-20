-- personalization.lua
-- Customizing experience on neovim


vim.g.editorconfig = true
require("catppuccin").setup({
  flavor = "mocha",
  integrations = {
    cmp = true,
    treesitter = true,
    telescope = {
      enabled = true
    }
  }
})
vim.cmd.colorscheme "catppuccin"

-- Telescope (Fuzzy finder)
local telescope = require("telescope")
local tc = require("telescope.builtin")
local tcConfig = require("telescope.config")
local tcVimGrep = { unpack(tcConfig.values.vimgrep_arguments) }
-- I want to search in hidden/dot files.
table.insert(tcVimGrep, "--hidden")
-- I don't want to search in the `.git` directory.
table.insert(tcVimGrep, "--glob")
table.insert(tcVimGrep, "!**/.git/*")
telescope.setup({
	defaults = {
		-- `hidden = true` is not supported in text grep commands.
		vimgrep_arguments = tcVimGrep,
	},
	pickers = {
		find_files = {
			-- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
			find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
		},
	},
})
vim.keymap.set('n', '<C-p>', tc.find_files, {})
vim.keymap.set('n', '<leader>gb', tc.buffers, {})
vim.keymap.set('n', '<leader>gg', tc.live_grep, {})
