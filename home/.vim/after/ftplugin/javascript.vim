" home/.vim/after/ftplugin/javascript.vim
"
" @author Augusto Pascutti <augusto.hp@gmail.com>
"

setlocal noexpandtab
setlocal tabstop=2
setlocal shiftwidth=2

nnoremap <buffer> <leader>l :!node --check <C-R>% <CR>
nnoremap <buffer> <leader>d :!npm test -- <C-R>%<CR>
