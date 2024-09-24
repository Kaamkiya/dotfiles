" Disable Vi compatibility, which can cause problems
set nocompatible

"""""""""""
" Graphics
"""""""""""

" Enable syntax highlighing
syntax on

" Only redraw when necessary, not at every frame
set lazyredraw

" Show line numbers
set number

" Show cursor line and column
set cursorcolumn
set cursorline

" Set the colorscheme
colorscheme catppuccin_mocha

" Always show status bar
set laststatus=2

"""""""""""
" Editing
"""""""""""

filetype on

" Update when the file is edited from elsewhere
set autoread

" Make sure there are always 5 line above and below the cursor
set scrolloff=5

" Allow usage of the mouse
set mouse=a

" Configure backspace to be better
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set autoindent
set smartindent

" Disable line wrap
set nowrap

" Turn off backup files
set noswapfile

""""""""""""
" Lightline
""""""""""""
let g:lightline = {
    \ 'colorscheme': 'OldHope',
    \ }

"""""""""""""""
" Autocomplete
"""""""""""""""

" Autocompletion for commands
set wildmenu

""""""""""""
" Searching
""""""""""""

" Highlight search results
set hlsearch

" Ignore case when searching
set ignorecase

" Make searching more like in modern browsers
set incsearch

" For regexes in searching
set magic

""""""""""""""
" Indentation
""""""""""""""

" 2 space indent by default
setl expandtab
setl tabstop=2
setl shiftwidth=2

" 4 space indent for Python/D/Bash/Rust/Zig
au BufRead,BufNewFile *.py,*.d,*.sh,*.bash,*.rs,*.zig setl shiftwidth=4
au BufRead,BufNewFile *.py,*.d,*.sh,*.bash,*.rs,*.zig setl tabstop=4

" 8 space indent for Assembly (NASM)
au BufRead,BufNewFile *.asm setl shiftwidth=8
au BufRead,BufNewFile *.asm setl tabstop=8

" 8 space width tab indent for Go/Makefile
au BufRead,BufNewFile *.go,Makefile setl shiftwidth=8
au BufRead,BufNewFile *.go,Makefile setl tabstop=8
au BufRead,BufNewFile *.go,Makefile setl noexpandtab

""""""""""""""""""""""""""""""""""""""""""""""

if has("autocmd") && exists("+omnifunc")
autocmd Filetype *
    \ if &omnifunc == "" |
    \ setlocal omnifunc=syntaxcomplete#Complete |
    \ endif
    endif
