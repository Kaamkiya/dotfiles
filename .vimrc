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
colorscheme ghdark

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
setl shiftwidth=2
setl tabstop=2

" 4 space indent for Python/D
au BufRead,BufNewFile *.py,*.d setl shiftwidth=4
au BufRead,BufNewFile *.py,*.d setl tabstop=4

" 8 space width tab indent for Go
au BufRead,BufNewFile *.go setl shiftwidth=8
au BufRead,BufNewFile *.go setl tabstop=8
au BufRead,BufNewFile *.go setl noexpandtab

""""""""""""""""""""""""""""""""""""""""""""""

if has("autocmd") && exists("+omnifunc")
autocmd Filetype *
    \ if &omnifunc == "" |
    \ setlocal omnifunc=syntaxcomplete#Complete |
    \ endif
    endif
