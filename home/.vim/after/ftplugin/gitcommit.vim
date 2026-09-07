" home/.vim/after/gitcommit.vim
"
" @author Augusto Pascutti <augusto.hp@gmail.com>

setlocal textwidth=72
setlocal spell spelllang=en_us
setlocal spell spelllang+=pt_br

" Use Git configurations
runtime after/ftplugin/git.vim

" On the line of a file: Show its diff an an split.
nnoremap <buffer> <leader>d ^f:wy$:new \| read !git diff --cached *<C-R>"<CR>:set ft=diff<CR>
nnoremap <buffer> <leader>c :bdelete!<CR>
