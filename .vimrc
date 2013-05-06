" VUNDLE
"

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle manage Vundle
Bundle 'gmarik/vundle'

" Bundles
Bundle 'ack.vim'
Bundle 'renamer.vim'
Bundle 'surround.vim'
Bundle 'ctrlp.vim'
Bundle 'Gundo'
Bundle 'mattn/gist-vim'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/neosnippet'
Bundle 'The-NERD-tree'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-rails'
Bundle 'vim-coffee-script'


" Settings
"
set history=1000
set nobackup
set nocompatible
set nowritebackup
set number
set ruler
set scrolloff=3
set tw=150
set visualbell

" Make file/command completion useful
set wildmode=list:longest

" Search+replace
set ignorecase
set incsearch
set smartcase

" Tab settings
set tabstop=2
set bs=2
set shiftwidth=2
set smarttab
set expandtab
filetype plugin indent on


" Colors, fonts
syntax on
colorscheme blackboard
" highlight Pmenu ctermbg=5 guibg=#004e9c


" Load matchit (% to bounce from do to end, etc.)
runtime! macros/matchit.vim


" BINDINGS

let mapleader = ","

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


" MacVim
"
if has("gui_running")
  set guifont=Monaco:h12
  set guioptions=egmrt
  set background=dark
  " set background=light
  colorscheme solarized

  function! ToggleBackground()
    if (g:solarized_style=="dark")
      let g:solarized_style="light"
      colorscheme solarized
    else
      let g:solarized_style="dark"
      colorscheme solarized
    endif
  endfunction
  command! Togbg call ToggleBackground()
  nnoremap <F5> :call ToggleBackground()<CR>
  inoremap <F5> <ESC>:call ToggleBackground()<CR>a
  vnoremap <F5> <ESC>:call ToggleBackground()<CR>

  " Autoopen NERDTree on vim start
  autocmd GUIEnter * NERDTree

  " MacVim now supports swipe!
  nmap <SwipeLeft> :bN<CR>
  nmap <SwipeRight> :bn<CR>
endif

