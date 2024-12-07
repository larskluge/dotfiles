if &compatible
 set nocompatible              " be iMproved, required
endif

" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')
  call dein#add('~/.cache/dein')

  call dein#add('bling/vim-airline')
  call dein#add('ctrlpvim/ctrlp.vim')
  call dein#add('elixir-lang/vim-elixir')
  call dein#add('godlygeek/tabular')
  call dein#add('jbmorgado/vim-pine-script')
  call dein#add('JuliaEditorSupport/julia-vim')
  call dein#add('mhinz/vim-mix-format')
  call dein#add('mileszs/ack.vim')
  call dein#add('qpkorr/vim-renamer')
  call dein#add('rhysd/vim-crystal')
  call dein#add('romainl/flattened')
  call dein#add('scrooloose/nerdtree')
  call dein#add('slim-template/vim-slim')
  call dein#add('tomtom/tcomment_vim')
  " call dein#add('tpope/vim-fugitive')         " Git integration
  call dein#add('tpope/vim-surround')
  call dein#add('vim-ruby/vim-ruby')
  call dein#add('will133/vim-dirdiff')

  " call dein#add('ap/vim-css-color')  " Highlight CSS Colors
  " call dein#add('morhetz/gruvbox') " Color scheme
  " call dein#add('altercation/vim-colors-solarized')   " does not work (yet?) with neovim
  " call dein#add('benmills/vimux')             " Tmux integration
  " call dein#add('derekwyatt/vim-scala')
  " call dein#add('digitaltoad/vim-jade')
  " call dein#add('ekalinin/Dockerfile.vim')
  " call dein#add('fatih/vim-go')
  " call dein#add('gregsexton/gitv')
  " call dein#add('honza/vim-snippets')
  " call dein#add('kchmck/vim-coffee-script')
  " call dein#add('mattn/gist-vim')
  " call dein#add('mattn/webapi-vim')
  " call dein#add('othree/coffee-check.vim')
  " call dein#add('rking/ag.vim')
  " call dein#add('scrooloose/syntastic')
  " call dein#add('Shougo/deoplete.nvim')
  " call dein#add('tpope/vim-abolish')
  " call dein#add('tpope/vim-dispatch')
  " call dein#add('tpope/vim-endwise')
  " call dein#add('tpope/vim-markdown')
  " call dein#add('tpope/vim-rails')
  " call dein#add('tpope/vim-sensible')         " General settings
  " call dein#add('vim-scripts/Gundo')
  " call dein#add('xolox/vim-lua-ftplugin')
  " call dein#add('xolox/vim-misc')

  if !has('nvim')
    "call dein#add('roxma/nvim-yarp')
    "call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" Install not installed plugins on startup
if dein#check_install()
  call dein#install()
endif



let mapleader = ","


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
set nowrap
set colorcolumn=100

" Make file/command completion useful
set wildmode=list:longest

" General Ignores
set wildignore+=*.so,*.pyc,*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
set wildignore+=*/tmp/*,*/tmp/cache/assets/*/sprockets/*,*/tmp/cache/assets/*/sass/*
set wildignore+=*.swp,*~,._*

" Search+replace
set ignorecase
set incsearch
set smartcase
set hlsearch

" Tab settings
set tabstop=2
set backspace=2
set softtabstop=2
set shiftwidth=2
set smarttab
set expandtab

" Jump to the last know position in a file after opening it
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
" Clear the search buffer when hitting return
" :nnoremap <CR> :nohlsearch<cr>

" Colors, fonts
" highlight Pmenu ctermbg=5 guibg=#004e9c
" let g:airline_theme = 'solarized'



" Load matchit (% to bounce from do to end, etc.)
runtime! macros/matchit.vim


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

" Elixir
let g:mix_format_on_save = 1


" BINDINGS

" Buffer Navigation
map <leader>c <C-w>c
map <leader>h <C-w>h
map <leader>j <C-w>j
map <leader>k <C-w>k
map <leader>l <C-w>l


map <leader>a :Ack<Space>
:map <leader>b :CtrlPBuffer<CR>

" Removes trailing spaces
function TrimWhiteSpace()
  %s/\s*$//
  ''
:endfunction
autocmd FileWritePre,FileAppendPre,FilterWritePre,BufWritePre * :call TrimWhiteSpace()


" " MacVim
" "
" if has("gui_running")
"   set guifont=Monaco:h12
"   set guioptions=egmrt
"
"   " MacVim now supports swipe!
"   nmap <SwipeLeft> :bN<CR>
"   nmap <SwipeRight> :bn<CR>
" endif

set secure
