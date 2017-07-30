set nocompatible              " be iMproved, required
filetype off                  " required


" VUNDLE
"

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Bundles
Plugin 'ack.vim'
Plugin 'ctrlp.vim'
Plugin 'derekwyatt/vim-scala'
Plugin 'digitaltoad/vim-jade'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'elixir-lang/vim-elixir'
Plugin 'fatih/vim-go'
Plugin 'Gundo'
Plugin 'mattn/gist-vim'
Plugin 'othree/coffee-check.vim'
Plugin 'renamer.vim'
Plugin 'Shougo/neocomplcache'
Plugin 'Shougo/neosnippet'
Plugin 'slim-template/vim-slim'
Plugin 'surround.vim'
Plugin 'Tabular'
Plugin 'tComment'
Plugin 'The-NERD-tree'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-rails'
Plugin 'vim-coffee-script'
Plugin 'xolox/vim-lua-ftplugin'
Plugin 'xolox/vim-misc'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" Settings
"
set history=1000
set nobackup
set nowritebackup
set number
set ruler
set scrolloff=3
set textwidth=0
set wrapmargin=0
set visualbell
set noswapfile
set exrc

" Make file/command completion useful
set wildmode=list:longest

" General Ignores
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc

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

:map <leader>b :CtrlPBuffer<CR>

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
  autocmd VimEnter * wincmd p

  " MacVim now supports swipe!
  nmap <SwipeLeft> :bN<CR>
  nmap <SwipeRight> :bn<CR>
endif

set secure

