" home/.vim/after/ftplugin/php.vim
"
" @author Augusto Pascutti <augusto.hp@gmail.com>

setlocal autoindent
setlocal showmatch
setlocal expandtab
setlocal tabstop=4
setlocal shiftwidth=4

"List functions on current file
nnoremap <buffer> <leader>e :lvimgrep /function [a-zA-Z_\x7f-\xff][a-zA-Z0-9_\x7f-\xff]*/ <C-R>% <CR>:lopen<CR>
" Sorts 'use' lines
nnoremap <buffer> <leader>s /^use <VR>ggnvG$N$:!sort<CR>
nnoremap <buffer> <leader>l :!php -l <C-R>% <CR>
nnoremap <buffer> <leader>t :!vendor/bin/phpunit <C-R>% <CR>
nnoremap <buffer> <leader>c :!vendor/bin/phpcs <C-R>% <CR>
nnoremap <buffer> <leader>p :!vendor/bin/psalm -m <C-R>% <CR>

" Removes trailing white spaces
nnoremap <buffer> <leader>tws :%s/\s\+$//e
