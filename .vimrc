set clipboard=unnamedplus
set number

" indent
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
set cindent
set inc=1

noremap :t :tabnew 

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
noremap <Esc> <Nop>
noremap <BS> <Nop>

:hi Comment ctermfg=yellow
