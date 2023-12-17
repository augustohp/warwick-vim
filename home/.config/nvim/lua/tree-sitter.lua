-- tree-sitter.lua
-- Better syntax highlight

require'nvim-treesitter.configs'.setup {
  ensure_installed = {
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
      "latex",
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
  },
  sync_install = false,
  auto_install = true,
  ignore_install = {},

  indent = {
    enable = false
  },

  highlight = {
    enable = true,
    -- disable on big files
    disable = function(lang, buf)
      local max_filesize = 100 * 1024 -- 100 KB
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then
          return true
      end
    end,
    additional_vim_regex_highlighting = false,
  },
}
