" enable pathogen
execute pathogen#infect()
let NERDTreeHijackNetrw=1
filetype plugin on

" command-t options
let g:CommandTMaxFiles=50000
let g:CommandTTraverseSCM='dir'

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

" autoread mode
set autoread

" shortcut to scroll inactive split window
nmap <a-j> <c-w>w<c-e><c-w>w
nmap <a-k> <c-w>w<c-y><c-w>w

" colortheme
syntax enable
set background=dark
colorscheme solarized
