" enable pathogen
execute pathogen#infect()
let NERDTreeHijackNetrw=1
filetype plugin on

" vim-latex options
let g:tex_flavor='latex'
set grepprg=grep\ -nH\ $*
imap <C-space> <Plug>IMAP_JumpForward
nmap <C-space> <Plug>IMAP_JumpForward
vmap <C-space> <Plug>IMAP_JumpForward
autocmd Filetype tex setlocal tw=80

" command-t options
"nnoremap <silent> <Leader>j :CommandTTag<CR>
"nnoremap <silent> <Leader>p :CommandT %:p:h<CR>
let g:CommandTMaxFiles=50000
let g:CommandTTraverseSCM='dir'

" ctrlp options
nnoremap <silent> <Leader>j :CtrlPTag<CR>
nnoremap <silent> <Leader>p :CtrlP %:p:h<CR>
nnoremap <silent> <leader>t :CtrlP<CR>
let g:ctrlp_max_height=50

" look for tags file
set tags=tags;/
set tags+=~/.vim/tags/cpp
" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 0 " autocomplete after .
let OmniCpp_MayCompleteArrow = 0 " autocomplete after ->
let OmniCpp_MayCompleteScope = 0 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

" Cmdline Complete
set wcm=<C-E>
cmap <expr> <TAB> (getcmdtype() == '/') ? "\<Plug>CmdlineCompleteForward" : "\<C-E>"
"cmap <S-TAB> <Plug>CmdlineCompleteBackward
"cnoremap <TAB> <Plug>CmdlineCompleteForward

" ctrlp setup
set runtimepath^=~/.vim/bundle/ctrlp.vim

" bash-like tab completion
set wildmode=longest,list,full
set wildmenu

" show line numbers
set number

" tab management
set expandtab
set shiftwidth=4
set smarttab

" indentation
filetype plugin indent on

" enable hidden buffers mode
set hidden

" map F5 to manage buffers
nnoremap <F5> :buffers<CR>:buffer<Space>
" Bbye (Bdelete) mappings
nnoremap <Leader>q :Bdelete<CR>

" See unsaved changes
function! s:DiffWithSaved()
    let filetype=&ft
    diffthis
    vnew | r # | normal! 1Gdd
    diffthis
    exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

" autoread mode
set autoread

" incremental search mode
set incsearch

" shortcut to scroll inactive split window
nmap <a-j> <c-w>w<c-e><c-w>w
nmap <a-k> <c-w>w<c-y><c-w>w

" map S-Enter to edit line above in insert mode (using iterm2 remapping
" S-Enter to ✠
inoremap ✠ <C-O>O
inoremap <S-CR> <C-O>O

" add < and > to matched pairs
set matchpairs+=<:>

" colortheme
syntax enable
set background=dark
colorscheme solarized
let g:solarized_diffmode="high"
if &diff
    colorscheme solarized
endif
highlight! link DiffText MatchParen
