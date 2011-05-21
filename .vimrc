set number
set ruler
set nocompatible
set nobackup
set nowritebackup
set tw=150
set visualbell

set history=1000

" Make file/command completion useful
set wildmode=list:longest

set scrolloff=3

" search+replace
set ignorecase
set smartcase
set incsearch
" set gdefault
" set hlsearch


" colors, fonts
syntax on
au BufNewFile,BufRead *.j setf objj
colorscheme blackboard
" highlight Pmenu ctermbg=5 guibg=#004e9c

if has("gui_running")
  set guifont=Monaco:h12
  set guioptions=egmrt
  " set background=dark
  set background=light
  colorscheme solarized
endif



" load matchit (% to bounce from do to end, etc.)
runtime! macros/matchit.vim

" tab settings
set tabstop=2
set bs=2
set shiftwidth=2
set smarttab
set expandtab
filetype plugin indent on




" BINDINGS

let mapleader = ","

" fuzzy file finder
map <leader>t :FuzzyFinderTextMate<CR>
map <leader>b :FuzzyFinderBuffer<CR>
let g:fuzzy_ignore = "*.log,doc/app/**/*,*.png,*.gif,*.jpg,*.jpeg,vendor/*,tmp/*,script/*,public/system/*,public/demofiles/*,public/stuffs/*"
let g:fuzzy_ceiling = 50000


map! <F1> <Esc>
map <F2> :NERDTreeToggle<CR>

map <leader>c <C-w>c

map <leader>h <C-w>h
map <leader>j <C-w>j
map <leader>k <C-w>k
map <leader>l <C-w>l

map <leader>a :Ack<Space>

:map <C-t> :tabnew<CR>
" :map <C-w> :tabclose<CR>
:map <C-Tab> :tabnext<CR>
:map <C-S-Tab> :tabprevious<CR>



" Removes trailing spaces
function TrimWhiteSpace()
  %s/\s*$//
  ''
:endfunction

autocmd FileWritePre,FileAppendPre,FilterWritePre,BufWritePre * :call TrimWhiteSpace()


" Tweak EasyGrep
let g:EasyGrepMode = 2
let g:EasyGrepRecursive = 1


" Markdown
augroup mkd
  autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:&gt;
augroup END


" MacVim now supports swipe!
nmap <SwipeLeft> :bN<CR>
nmap <SwipeRight> :bn<CR>

