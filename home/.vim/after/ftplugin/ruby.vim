" home/.vim/after/ftplugin/ruby.vim
"
" @author Augusto Pascutti <augusto.hp@gmail.com>

setlocal showmatch
setlocal expandtab
setlocal tabstop=2
setlocal shiftwidth=2

nnoremap <buffer> <leader>l :!ruby -c <C-R>% <CR>
nnoremap <buffer> <leader>d :!bundle exec rspec <C-R>% <CR>
