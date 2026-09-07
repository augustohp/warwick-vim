-- tree-sitter.lua
-- Rich syntax highlighting for Neovim without startup-time installation.

local parsers = {
  "bash",
  "c",
  "diff",
  "dot",
  "gitattributes",
  "gitcommit",
  "git_config",
  "gitignore",
  "git_rebase",
  "go",
  "gomod",
  "gosum",
  "gowork",
  "hcl",
  "html",
  "http",
  "ini",
  "javascript",
  "jq",
  "jsdoc",
  "json",
  "lua",
  "make",
  "markdown",
  "mermaid",
  "php",
  "phpdoc",
  "query",
  "ssh_config",
  "terraform",
  "typescript",
  "vim",
  "vimdoc",
  "xml",
}

require("nvim-treesitter.configs").setup({
  ensure_installed = {},
  auto_install = false,
  indent = { enable = true },
  highlight = {
    enable = true,
    disable = function(_, buffer)
      local stats = vim.uv.fs_stat(vim.api.nvim_buf_get_name(buffer))
      return stats and stats.size > 100 * 1024
    end,
    additional_vim_regex_highlighting = false,
  },
})

return {
  install = function()
    if vim.fn.exists(":TSInstallSync") == 0 then
      vim.cmd.runtime("plugin/nvim-treesitter.lua")
    end
    vim.cmd.TSInstallSync({ args = parsers })
  end,
}
