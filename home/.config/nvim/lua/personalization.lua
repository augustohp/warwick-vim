-- personalization.lua
-- Customizing experience on neovim

require("catppuccin").setup({
  flavor = "mocha",
  integrations = {
    cmp = true,
    treesitter = true,
    telescope = { enabled = true },
  },
})
vim.cmd.colorscheme "catppuccin"

vim.schedule(function()
  local telescope = require("telescope")
  local builtin = require("telescope.builtin")
  local telescope_config = require("telescope.config")
  local vimgrep_arguments = { (table.unpack or unpack)(telescope_config.values.vimgrep_arguments) }

  table.insert(vimgrep_arguments, "--hidden")
  table.insert(vimgrep_arguments, "--glob")
  table.insert(vimgrep_arguments, "!**/.git/*")

  telescope.setup({
    defaults = {
      vimgrep_arguments = vimgrep_arguments,
    },
    pickers = {
      find_files = {
        find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
      },
    },
  })

  vim.keymap.set("n", "<C-p>", builtin.find_files)
  vim.keymap.set("n", "<leader>gb", builtin.buffers)
  vim.keymap.set("n", "<leader>gg", builtin.live_grep)
end)
