" home/.vim/after/ftplugin/fern.vim
"
" Fern buffer mappings

if exists("b:did_warwick_fern_ftplugin")
  finish
endif
let b:did_warwick_fern_ftplugin = 1

" Smart open, expand, and collapse behavior
nmap <buffer><expr>
      \ <Plug>(fern-my-open-expand-collapse)
      \ fern#smart#leaf(
      \   "\<Plug>(fern-action-open:select)",
      \   "\<Plug>(fern-action-expand)",
      \   "\<Plug>(fern-action-collapse)",
      \ )
nmap <buffer><nowait> l <Plug>(fern-my-open-expand-collapse)
nmap <buffer> <CR> <Plug>(fern-my-open-expand-collapse)

" NERDTree-like mappings
nmap <buffer> o <Plug>(fern-action-open:edit)
nmap <buffer> go <Plug>(fern-action-open:edit)<C-w>p
nmap <buffer> t <Plug>(fern-action-open:tabedit)
nmap <buffer> T <Plug>(fern-action-open:tabedit)gT
nmap <buffer> i <Plug>(fern-action-open:split)
nmap <buffer> gi <Plug>(fern-action-open:split)<C-w>p
nmap <buffer> s <Plug>(fern-action-open:vsplit)
nmap <buffer> gs <Plug>(fern-action-open:vsplit)<C-w>p
nmap <buffer> ma <Plug>(fern-action-new-path)
nmap <buffer> P gg
nmap <buffer> C <Plug>(fern-action-enter)
nmap <buffer> u <Plug>(fern-action-leave)
nmap <buffer> r <Plug>(fern-action-reload)
nmap <buffer> R gg<Plug>(fern-action-reload)<C-o>
nmap <buffer> cd <Plug>(fern-action-cd)
nmap <buffer> CD gg<Plug>(fern-action-cd)<C-o>
nmap <buffer> I <Plug>(fern-action-hidden-toggle)
nmap <buffer> q :<C-u>quit<CR>

" Preview files while moving through a drawer
nmap <buffer><expr>
      \ <Plug>(fern-my-preview-or-nop)
      \ fern#smart#leaf(
      \   "\<Plug>(fern-action-open:edit)\<C-w>p",
      \   "",
      \ )
nmap <buffer><expr> j
      \ fern#smart#drawer(
      \   "j\<Plug>(fern-my-preview-or-nop)",
      \   "j",
      \ )
nmap <buffer><expr> k
      \ fern#smart#drawer(
      \   "k\<Plug>(fern-my-preview-or-nop)",
      \   "k",
      \ )
