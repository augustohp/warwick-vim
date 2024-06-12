" home/.vim/after/ftplugin/php.vim
"
" @author Augusto Pascutti <augusto.hp@gmail.com>

set autoindent
set showmatch
set expandtab
set tabstop=4
set shiftwidth=4
retab

"List functions on current file
nnoremap <leader>e :lvimgrep /function [a-zA-Z_\x7f-\xff][a-zA-Z0-9_\x7f-\xff]*/ <C-R>% <CR>:lopen<CR>
" Sorts 'use' lines
nnoremap <leader>s /^use <VR>ggnvG$N$:!sort<CR>
nnoremap <leader>l :!php -l <C-R>% <CR>
nnoremap <leader>t :!vendor/bin/phpunit <C-R>% <CR>
nnoremap <leader>c :!vendor/bin/phpcs <C-R>% <CR>
nnoremap <leader>p :!vendor/bin/psalm -m <C-R>% <CR>

" Removes trailing white spaces
nnoremap <leader>tws :%s/\s\+$//e
