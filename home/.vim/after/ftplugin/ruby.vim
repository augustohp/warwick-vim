" home/.vim/after/ftplugin/vim.vim
"
" @author Augusto Pascutti <augusto.hp@gmail.com>

set showmatch
set expandtab
set tabstop=2
set shiftwidth=2
retab

nnoremap <leader>l :!ruby -c <C-R>% <CR>
nnoremap <leader>d :!bundle exec rspec <C-R>% <CR>

" Removes trailing white spaces
autocmd BufWritePre * :%s/\s\+$//e
