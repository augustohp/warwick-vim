" home/.vim/after/ftplugin/fern.vim
"
" Fern buffer mappings

if exists("b:did_warwick_fern_ftplugin")
  finish
endif
let b:did_warwick_fern_ftplugin = 1

" NERDTree-style activation: open files and toggle directories in place
nmap <buffer><silent><expr>
      \ <Plug>(fern-my-activate)
      \ fern#smart#leaf(
      \   "\<Plug>(fern-action-open)",
      \   "\<Plug>(fern-action-expand:stay)",
      \   "\<Plug>(fern-action-collapse)",
      \ )
nmap <buffer><silent> o <Plug>(fern-my-activate)
nmap <buffer><silent> <CR> <Plug>(fern-my-activate)

" Directional tree navigation
nmap <buffer><nowait> l <Plug>(fern-action-open-or-expand)
nmap <buffer><nowait> h <Plug>(fern-action-collapse)

" NERDTree-like mappings
nmap <buffer> go <Plug>(fern-action-open)<C-w>p
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
