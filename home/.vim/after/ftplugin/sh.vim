" home/.vim/after/ftplugin/sh.vim
"
" Shell script specific mappings

setlocal noexpandtab
setlocal tabstop=4
setlocal shiftwidth=4

nnoremap <buffer> <leader>l :!shellcheck <C-R>%<CR>
