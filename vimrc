" enable pathogen
let g:pathogen_disabled = []
execute pathogen#infect()
filetype plugin on

let VIMRCDIR = fnamemodify( expand("$MYVIMRC"), ":p:h" )

" FZF plugin
set rtp+=/opt/local/share/fzf/vim
nnoremap <silent> <leader>gg :Rg<CR>
nnoremap <silent> <leader>gw :Rg <C-R><C-W><CR>

" vim-latex options
let g:tex_flavor='latex'
set grepprg=grep\ -nH\ $*
imap <C-space> <Plug>IMAP_JumpForward
autocmd VimEnter * imap <buffer> <C-space> <Plug>IMAP_JumpForward
nmap <C-space> <Plug>IMAP_JumpForward
vmap <C-space> <Plug>IMAP_JumpForward
autocmd Filetype tex setlocal tw=80
let g:Tex_CompileRule_pdf = 'pdflatex -shell-escape -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
let g:Tex_ViewRule_pdf = 'Skim'
let g:Tex_IgnoredWarnings = 
    \'Underfull'."\n".
    \'Overfull'."\n".
    \'specifier changed to'."\n".
    \'You have requested'."\n".
    \'Label(s) may have changed.'."\n".
    \'LaTeX Font Warning:'."\n".
    \'Missing number, treated as zero.'."\n".
    \'There were undefined references'."\n".
    \'Citation %.%# undefined'."\n".
    \'Double space found.'."\n"
let g:Tex_IgnoreLevel = 6
let g:Tex_CustomTemplateDirectory = VIMRCDIR.'/ftplugin/latex-suite/templates/'.','
            \ .VIMRCDIR.'/bundle/vim-latex/ftplugin/latex-suite/templates/'
let g:Tex_GotoError = 0

" ctrlp options
nnoremap <silent> <leader>t :CtrlP<CR>
nnoremap <silent> <Leader>j :CtrlPTag<CR>
nnoremap <silent> <Leader>p :CtrlP %:p:h<CR>
nnoremap <silent> <Leader>b :CtrlPBuffer<CR>
nnoremap <silent> <Leader>k :CtrlPQuickfix<CR>
nnoremap <silent> <Leader>l :CtrlPLine<CR>
let g:ctrlp_max_height=50
if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
elseif executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
" ctrlp setup
set runtimepath^=~/.vim/bundle/ctrlp.vim

" ShowFunc ctags
let g:showfuncctagsbin="/opt/local/bin/ctags"
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

" bash-like tab completion
set wildmode=longest,list,full
set wildmenu

" show line numbers (hybrid or absolute)
set number
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

" status line
set statusline+=%-03.4n                      " buffer number
set statusline+=%f                           " filename
set statusline+=%h%m%r%w                     " status flags
set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type
set statusline+=%=                           " right align remainder
set statusline+=0x%-8B                       " character value
set statusline+=%-14(%l,%c%V%)               " line, character
set statusline+=%<%P                         " file position

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

" highlight search results
set hlsearch
nnoremap <silent> <esc> <esc>:noh<CR>

" incremental search mode
set incsearch

" shortcut to scroll inactive split window
nmap <a-j> <c-w>w<c-e><c-w>w
nmap <a-k> <c-w>w<c-y><c-w>w

" map S-Enter to edit line above in insert mode (using iterm2 remapping
" S-Enter to ✠
inoremap ✠ <C-O>O
inoremap <S-CR> <C-O>O

" terminal mappings
" ESC-ESC -> normal mode
tnoremap <Esc><Esc> <Esc><C-W>N

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

" remove bell
set visualbell t_vb= 
