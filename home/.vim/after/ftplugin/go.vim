" home/.vim/after/ftplugin/go.vim
"
" @author Augusto Pascutti <augusto.hp@gmail.com>

setlocal noexpandtab
setlocal tabstop=4

" Checkstyle of current buffer
nnoremap <buffer> <leader>c :!gofmt -d -s <C-R>% <CR>
