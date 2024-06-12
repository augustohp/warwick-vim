" init.vim
" nvim configuration
" vim: ts=2 sw=2 ft=vim:

" load vim configuration
set runtimepath^=~/.vim runtimepath+=~/.vim/after,$XDG_CONFIG_HOME/nvim
let &packpath = &runtimepath
source ~/.vim/vimrc
colorscheme catppuccin-mocha

lua <<EOF
  require("tree-sitter")
  require("lsp")
  require("nvim-cmp")
  require("personalization")
EOF
