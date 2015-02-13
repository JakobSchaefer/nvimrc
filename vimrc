"""""""""""""""""""""""""""""""""
" gvim settings
if has("gui_running")
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif

""""""""""""""""""""
" VUNDLE
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-surround'
Plugin 'Raimondi/delimitMate'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/nerdtree'

Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/vimshell.vim'

Plugin 'tomasr/molokai'

call vundle#end()

filetype plugin indent on
""""""""""""""""""""
" Plugin settings and mappings
map f <Plug>(easymotion-s)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

map <leader>s ysiw
map <leader>S yss

let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'

" BASIS
set history=1000
set autoread
set backspace=eol,start,indent
set noerrorbells
set novisualbell
set t_vb=
set tm=500
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1
set lines=50
set columns=125
set updatetime=750
set splitbelow
set splitright

let mapleader = ","

" SUCHE
set hlsearch
set smartcase
set incsearch

" OBERFLAECHE
set scrolloff=10
set wildmenu
set wildignore=*.o
set ruler
set number
set cmdheight=1
set laststatus=2
syntax on
set cursorline
set t_Co=256

" STATUSBAR
set statusline-=%t

" FARBEN UND FORMATIERUNGEN
set background=dark
colorscheme molokai
set encoding=utf8
set ffs=unix,dos,mac
set listchars=eol:¬,tab:»·,trail:·
set list
hi MatchParen cterm=bold ctermbg=none ctermfg=blue
:match Todo /NOTE/
:2match Error /TODO/
:3match Title /ERROR/

" SICHERUNGEN
set nobackup
set nowb
set noswapfile

" TABS UND ZEILENUMBRUECHE
set smarttab
set expandtab
set shiftwidth=2
set tabstop=2
set linebreak
set tw=500 " Zeilenumbruch nach 500 Zeichen
set autoindent
set smartindent
set wrap

"""""""""""""""""""" VISUALMODUS
" Deaktiviert die Pfeiltasten
vnoremap <down> <Nop>
vnoremap <left> <Nop>
vnoremap <right> <Nop>
vnoremap <up> <Nop>
inoremap <down> <Nop>
inoremap <left> <Nop>
inoremap <right> <Nop>
inoremap <up> <Nop>
nnoremap <down> ddp
noremap <left> <Nop>
noremap <right> <Nop>
nnoremap <up> ddkP

"""""""""""""""""""" INPUTMODUS
" Klammerung am ende einer Funktion
inoremap <leader>{ <ESC>o{}<ESC>i<CR><ESC>O

" BEASTMODE ON!!!!
imap jk <ESC>

"""""""""""""""""""" NORMALMODE
" Schnelles speichern und schliessen von Dokumenten
nmap <leader>w :w!<CR>
nmap <leader>q :q<CR>
nmap <leader><leader>q :q!<CR>
nmap ! :w<CR>:!

" Navigation innerhalb von Splitts
nmap gk <C-w>k
nmap gj <C-w>j
nmap gh <C-w>h
nmap gl <c-w>l

" Navigation überspringt nun keine Zeilenumbrüche
nnoremap k gk
nnoremap j gj

" Intuitivere Navigation mit shift
nmap J 5j
nmap K 5k

" Können viel arbeit ersparen
nnoremap <C-k> DO<ESC>pj$
nnoremap <C-j> Do<ESC>pk$
nnoremap <C-l> J
nnoremap <C-h> kddpkJ

" Handlicherer visual mode
nnoremap vb <C-v>
nnoremap vl <S-v>

" SUCHE
nmap . /
nmap <leader>. :noh<CR>

nnoremap <space> .

map <F2> :NERDTreeToggle<CR>
map <F3> <Nop>

" MAKE UND GIT!!
nmap <leader>m :w!<CR>:!make
if has("win32") || has('win64')
  let g:vimshell_prompt = $USERNAME."> "
  nmap <F5> <Plug>(vimshell_switch)./build.bat<CR><ESC>gh
  nmap <F6> <Plug>(vimshell_switch)./run.bat<CR><ESC>gh
else
  let g:vimshell_prompt = $USER."> "
endif

" Kleine Abkürzungen
iabbr cfhead /*<CR>File: <C-R>=expand("%:t")<CR><CR>Date: <C-R>=strftime("%c")<CR><CR>Creator: Jakob Schäfer<CR>Notice: (C) Copyright 2015 by Jakob Schäfer, Inc. All Rights Reserved.<CR>/<CR>

" vimrc autoreload
augroup reload_vimrc
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END
