" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim72/vimrc_example.vim or the vim manual
" and configure vim to your own liking!

if has("syntax")
  syntax on
endif

set nowrap
set ai
set ts=4
set shiftwidth=4
set smartindent
set background=dark

imap { <Esc>:call ReplaceCurly()<CR>"_cl
function! ReplaceCurly()
  imap { {
  " only replace outside of comments or strings (which map to constant)
  let elesyn = synIDtrans(synID(line("."), col(".") - 1, 0))
  if elesyn != hlID('Comment') && elesyn != hlID('Constant') && match(getline("."), "\\<new\\>") < 0
    exe "normal a{"
    " need to add a spare character (x) to position the cursor afterwards
    exe "normal ox"
    exe "normal o}"
    exe "normal kw"
  else
    " need to add a spare character (x) to position the cursor afterwards
    exe "normal a{x"
  endif
  imap { <Esc>:let word= ReplaceCurly()<CR>"_cl
endfunction

"Surround code with braces
nmap <Leader>{} O{<Esc>ddj>>ddkP
vmap <Leader>{} <Esc>o{<Esc>ddgv>gvdp
