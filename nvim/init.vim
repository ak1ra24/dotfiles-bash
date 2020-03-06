""""""""""""""""
" settings
""""""""""""""""
set number 
set autoindent
set tabstop=2  
set shiftwidth=2 
set expandtab    
set splitright 
set clipboard=unnamed
set hls         
set encoding=utf-8
scriptencoding utf-8
set ignorecase
set smartcase
set wrapscan
set incsearch
set inccommand=split
set tabstop=4
set shiftwidth=4
set softtabstop=0
set expandtab
set smarttab
set shiftround
set mouse=a
set fileencoding=utf-8
set fileformats=unix,dos,mac
set fileencodings=ucs-boms,utf-8,euc-jp,cp932
set ambiwidth=double
set noswapfile
set hidden
set nobackup

set wildmenu
set history=5000

augroup HTMLANDXML
    autocmd!
    autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
    autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END

""""""""""""""""
" keybinding
""""""""""""""""
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" 折り返し行移動
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

inoremap <silent> jj <ESC>:<C-u>w<CR>

""""""""""""""""
" dein
""""""""""""""""
if &compatible
  set nocompatible
endif

" Required:
let g:python_host_prog  = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'
let s:base_dir = expand('~/dotfiles/nvim')

" dein.vimインストール時に指定したディレクトリをセット
let s:dein_dir = expand('~/.cache/dein')

" dein.vimの実体があるディレクトリをセット
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vimが存在していない場合はgithubからclone
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" toml settings file
let s:toml_dir = s:base_dir . '/toml'

" Required:
if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)
    call dein#load_toml(s:toml_dir . '/dein.toml',     {'lazy':0})
    call dein#load_toml(s:toml_dir . '/dein_lazy.toml',  {'lazy':1})
    call dein#end()
    call dein#save_state()
endif
" If there are the plugins that has not been installed on startup,
" dein is checking and installing.
if dein#check_install()
    call dein#install()
endif

filetype plugin indent on
syntax on

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight LineNr ctermbg=none
highlight Folded ctermbg=none
highlight EndOfBuffer ctermbg=none 

