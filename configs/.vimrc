" Use Vim settings, rather then Vi settings. This setting must be as early as
" possible, as it has side effects.
set nocompatible

" Syntax highlighting
if has("syntax")
  syntax on
endif

" General options
set nowrap
set autoindent
set tabstop=4
set smartindent
set background=dark

" Set 4 space soft tabs
set softtabstop=4
set shiftwidth=4
set expandtab

" A script I found that on typing an opening brace immediately generates the
" closing brace and jumps to the next line with indentation
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
