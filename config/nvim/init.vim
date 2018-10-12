if !1 | finish | endif
filetype off

if has('vim_starting')
   set nocompatible               " Be iMproved
   set runtimepath+=~/.config/nvim/bundle/neobundle.vim/
endif

if has('nvim')
  runtime! python_setup.vim
endif

call neobundle#begin(expand('~/.config/nvim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'ack.vim'
NeoBundle 'ap/vim-css-color'
NeoBundle 'benmills/vimux'             " Tmux integration
NeoBundle 'bling/vim-airline'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'ekalinin/Dockerfile.vim'
NeoBundle 'fatih/vim-go'
NeoBundle 'gregsexton/gitv'
NeoBundle 'honza/vim-snippets'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'mattn/gist-vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'renamer.vim'
NeoBundle 'rking/ag.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'slim-template/vim-slim.git'
NeoBundle 'Tabular'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-fugitive'         " Git integration
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-sensible'         " General settings
NeoBundle 'tpope/vim-surround'
NeoBundle 'vim-ruby/vim-ruby'

call neobundle#end()
filetype plugin indent on
NeoBundleCheck

" General
let mapleader = ","
set nu

nmap <leader>s :source $MYVIMRC<CR>
nmap <leader>e :e $MYVIMRC<CR>

set nowrap
set nobackup
set noswapfile

set hlsearch    " highlight matches
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter

"set cursorline

set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
set wildignore+=*/tmp/cache/assets/*/sprockets/*,*/tmp/cache/assets/*/sass/*
set wildignore+=*.swp,*~,._*

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Jump to the last know position in a file after opening it
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
" Clear the search buffer when hitting return
:nnoremap <CR> :nohlsearch<cr>

" vim-ctrlspace
set hidden
hi CtrlSpaceSelected term=reverse ctermfg=187   guifg=#d7d7af ctermbg=23    guibg=#005f5f cterm=bold gui=bold
hi CtrlSpaceNormal   term=NONE    ctermfg=244   guifg=#808080 ctermbg=232   guibg=#080808 cterm=NONE gui=NONE
hi CtrlSpaceSearch   ctermfg=220  guifg=#ffd700 ctermbg=NONE  guibg=NONE    cterm=bold    gui=bold
hi CtrlSpaceStatus   ctermfg=230  guifg=#ffffd7 ctermbg=234   guibg=#1c1c1c cterm=NONE    gui=NONE

" NERD Tree
imap <leader>n <esc>:NERDTreeToggle<CR>
nmap <leader>n :NERDTreeToggle<CR>

" vimux
let g:VimuxPromptString = "=>"
let g:VimuxHeight = "30"
autocmd FileType ruby       map <Leader>rr :call VimuxRunCommand("clear; ruby -w " . bufname("%"))<CR>
autocmd FileType javascript map <Leader>rr :call VimuxRunCommand("clear; node " . bufname("%"))<CR>
autocmd FileType go         map <Leader>rr :call VimuxRunCommand("clear; go run " . bufname("%"))<CR>
map <Leader>vp :VimuxPromptCommand<CR>
map <Leader>vl :VimuxRunLastCommand<CR>
map <Leader>vi :VimuxInspectRunner<CR>
map <Leader>vq :VimuxCloseRunner<CR>
map <Leader>vx :VimuxInterruptRunner<CR>
map <Leader>vc :VimuxClearRunnerHistory<CR>
map <Leader>vz :VimuxZoomRunner<CR>

" vim-dispatch
" autocmd FileType ruby let b:dispatch = 'ruby -w %'
autocmd FileType ruby let b:dispatch = 'ruby %'
autocmd FileType javascript let b:dispatch = 'node %'
autocmd FileType go let b:dispatch = 'go run %'
nnoremap <leader>r :Dispatch<CR>
nnoremap <leader>v :Copen<CR>

" vim-ruby
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_use_bundler = 1

" vim-go
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)


" BINDINGS
map <leader>a :Ack<Space>
:map <leader>b :CtrlPBuffer<CR>

" Buffer Navigation
map <leader>c <C-w>c
map <leader>h <C-w>h
map <leader>j <C-w>j
map <leader>k <C-w>k
map <leader>l <C-w>l

" Removes trailing spaces
function TrimWhiteSpace()
  %s/\s*$//
  ''
:endfunction
autocmd filewritepre,fileappendpre,filterwritepre,bufwritepre * :call TrimWhiteSpace()


" NeoVim
"
" if has("gui_running")
"   set guifont=Monaco:h12
"   set guioptions=egmrt
"   set background=dark
"   " set background=light
"   colorscheme solarized
"
"   function! ToggleBackground()
"     if (g:solarized_style=="dark")
"       let g:solarized_style="light"
"       colorscheme solarized
"     else
"       let g:solarized_style="dark"
"       colorscheme solarized
"     endif
"   endfunction
"   command! Togbg call ToggleBackground()
"   nnoremap <F5> :call ToggleBackground()<CR>
"   inoremap <F5> <ESC>:call ToggleBackground()<CR>a
"   vnoremap <F5> <ESC>:call ToggleBackground()<CR>
"
"   " Autoopen NERDTree on vim start
"   " autocmd GUIEnter * NERDTree
"   " autocmd VimEnter * wincmd p
"
"   " " MacVim now supports swipe!
"   " nmap <SwipeLeft> :bN<CR>
"   " nmap <SwipeRight> :bn<CR>
" endif

set secure

