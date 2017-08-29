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

noremap m <C-d>
noremap , <C-u>
noremap <S-h> gT
noremap <S-l> gt

cnoremap s/ s/\v
nnoremap / /\v

noremap <Enter> <Nop>
noremap <Esc> <Nop>
noremap <BS> <Nop>
