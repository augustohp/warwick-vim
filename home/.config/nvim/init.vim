" init.vim
" nvim configuration
" vim: ts=2 sw=2 ft=vim:

" load vim configuration
let g:warwick_config = resolve(expand('<sfile>:p'))
set runtimepath^=~/.vim runtimepath+=~/.vim/after,$XDG_CONFIG_HOME/nvim
let &packpath = &runtimepath
source ~/.vim/vimrc

lua <<EOF
  if vim.fn.isdirectory(vim.fn.expand("~/.vim/bundle_nvim/nvim-treesitter")) == 1 then
    require("tree-sitter")
  end
  if vim.fn.isdirectory(vim.fn.expand("~/.vim/bundle_nvim/mason.nvim")) == 1 then
    vim.api.nvim_create_user_command("WarwickInstallLsp", function()
      require("lsp").install()
    end, { desc = "Install Warwick language servers" })

    vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
      once = true,
      callback = function()
        require("lsp")
      end,
    })
  end
  if vim.fn.isdirectory(vim.fn.expand("~/.vim/bundle_nvim/nvim-cmp")) == 1 then
    vim.schedule(function()
      require("nvim-cmp")
    end)
  end
  if vim.fn.isdirectory(vim.fn.expand("~/.vim/bundle_nvim/catppuccin")) == 1 then
    require("personalization")
  end
EOF
