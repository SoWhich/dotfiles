" Look for a readable instance of Vim-Plug
if filereadable(expand($HOME.'/.config/nvim/autoload/plug.vim'))
	call plug#begin($HOME.'/.config/nvim/plugged')
		" Async :make and linting framework
		Plug 'neomake/neomake'
		" Allows for easy switcheng between source and header files
		Plug 'nacitar/a.vim'
		" Redefines word to includ CamelCase and treat underscores like
		" spaces
		Plug 'chaoren/vim-wordmotion'
		" Does many things with character substitutions
		Plug 'tpope/vim-abolish'
	call plug#end()
endif

" turn on syntax highlighting, line numbering, and autoindenting for every
" file
syntax on
set number
set autoindent

" enables plugins and indent scripts based on filetype
filetype plugin indent on

" 8 character tabs and shiftwidth
set tabstop=8
set shiftwidth=8

" inform nvim that my terminal has a dark background
set background=dark

" runs neomake on save
augroup NeomakeOnSave
	 autocmd!
	 autocmd BufWritePost * Neomake
augroup END

" set colors or something
if has("termguicolors")
	 set termguicolors
endif

" set whitespace characters
set list
set listchars=
set listchars+=tab:˧\ ,
set listchars+=trail:·,

" set a line at 80 characters
if exists('+colorcolumn')
	set colorcolumn=80
	highlight colorcolumn ctermbg=1 guibg=yellow
else
	au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif
