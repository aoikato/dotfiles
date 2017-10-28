set clipboard=unnamedplus
set relativenumber

" indent
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
set cindent
set inc=1

cnoremap ta tabnew 

" navigation
noremap m <C-d>
noremap , <C-u>
nnoremap <C-p> gT
nnoremap <C-n> gt

" regular expression
cnoremap s/ s/\v
nnoremap / /\v

" caret-notation
noremap <Enter> <Nop>
lnoremap <Enter> <Nop>
noremap <BS> <Nop>
lnoremap <BS> <Nop>

cnoremap qf q!

:hi Comment ctermfg=yellow

" template
autocmd BufNewFile *.java 0r $HOME/.vim/template/java.txt
autocmd BufNewFile *.c 0r $HOME/.vim/template/c.txt
autocmd BufNewFile *.sh 0r $HOME/.vim/template/sh.txt

