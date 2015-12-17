" enable pathogen
execute pathogen#infect()
let NERDTreeHijackNetrw=1
filetype plugin on

" bash-like tab completion
set wildmode=longest,list,full
set wildmenu

" show line numbers
set number

" tab management
set expandtab
set shiftwidth=4
set smarttab

" enable hidden buffers mode
set hidden

" map F5 to manage buffers
nnoremap <F5> :buffers<CR>:buffer<Space>

" autoread mode
set autoread

" colortheme
syntax enable
set background=dark
colorscheme solarized
