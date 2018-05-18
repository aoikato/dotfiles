set clipboard=unnamedplus
set relativenumber
set number

" indent
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
set cindent
set inc=1

" mapping
" ex-mode
cnoremap ta tabnew 
cnoremap qf q!
" tab navigation
nnoremap <C-p> gT
nnoremap <C-n> gt
" regular expression
cnoremap s/ s/\v
nnoremap / /\v
" caret-notation
noremap <Enter> <Nop>
lnoremap <Enter> <Nop>
"noremap <BS> <Nop>
"lnoremap <BS> <Nop>
" save
nnoremap <F5> :up<CR><C-Z>
inoremap <F5> <Esc>:up<CR><C-Z>
nnoremap <F6> :up<CR>
inoremap <F6> <Esc>:up<CR>
" navigation
nnoremap j gj
nnoremap 0j 0j
nnoremap 1j 1j
nnoremap 2j 2j
nnoremap 3j 3j
nnoremap 4j 4j
nnoremap 5j 5j
nnoremap 6j 6j
nnoremap 7j 7j
nnoremap 8j 8j
nnoremap 9j 9j
nnoremap k gk
nnoremap 0k 0k
nnoremap 1k 1k
nnoremap 2k 2k
nnoremap 3k 3k
nnoremap 4k 4k
nnoremap 5k 5k
nnoremap 6k 6k
nnoremap 7k 7k
nnoremap 8k 8k
nnoremap 9k 9k
nnoremap <Space> <C-D>
nnoremap m <C-U>
" emacs-like navigation in command mode
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>
" join lines
nnoremap J gJ
" window navigation
"nnoremap s <NOP>
nnoremap ss :split 
nnoremap sv :vsplit 
nnoremap sh <C-W>h
nnoremap sj <C-W>j
nnoremap sk <C-W>k
nnoremap sl <C-W>l
nnoremap sw <C-W>w
nnoremap sH <C-W>H
nnoremap sJ <C-W>J
nnoremap sK <C-W>K
nnoremap sL <C-W>L
nnoremap sr <C-W>r
nnoremap s0 <C-w>=
nnoremap <C-j> <C-w>+
nnoremap <C-k> <C-w>-
nnoremap <BS> <C-w><
nnoremap <C-l> <C-w>>
nnoremap so <C-w>_<C-w>|
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap sQ :<C-u>bd<CR>
" VimShell
cnoremap sh VimShell


:hi Comment ctermfg=yellow

" template
autocmd BufNewFile *.java 0r $HOME/.vim/template/java.txt
autocmd BufNewFile *.c 0r $HOME/.vim/template/c.txt
autocmd BufNewFile *.sh 0r $HOME/.vim/template/sh.txt
autocmd BufNewFile *.tex 0r $HOME/.vim/template/tex.txt
autocmd BufNewFile *.d 0r $HOME/.vim/template/d.txt

" colorscheme
"colorscheme khaki
colorscheme default

set runtimepath+=~/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/vimproc.vim'
NeoBundle 'Shougo/vimshell.vim'
call neobundle#end()
filetype plugin indent on
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

syntax enable
