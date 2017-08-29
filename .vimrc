set clipboard=unnamedplus
set number

" indent
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
set cindent
set inc=1

cnoremap :t :tabnew 

" navigation
noremap m <C-d>
noremap , <C-u>
noremap <S-h> gT
noremap <S-l> gt

"regular expression
cnoremap s/ s/\v
nnoremap / /\v

" caret-notation
noremap <Enter> <Nop>
lnoremap <Enter> <Nop>
noremap <BS> <Nop>
lnoremap <BS> <Nop>

cnoremap qf q!

:hi Comment ctermfg=yellow
