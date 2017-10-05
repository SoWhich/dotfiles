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

		" Has a powerline like interface without being powerline
		Plug 'vim-airline/vim-airline'

		" Adds themes to airline
		Plug 'vim-airline/vim-airline-themes'

		" Adds nerdTree (a file explorer) to vim
		Plug 'scrooloose/nerdtree'

		" Adds Goyo, a plugin that simplifies the UI for a
		" 'distraction free' interface
		Plug 'junegunn/goyo.vim'

		" Adds limelight, a plugin that (when enabled) dimms
		" paragraphs not on/next to the cursor
		Plug 'junegunn/limelight.vim'

		" Adds vim-go, a plugin for golang
		Plug 'fatih/vim-go'

		" Adds java_getset, a plugin that generates accessors and
		" mutators for java
		Plug 'vim-scripts/java_getset.vim'

	call plug#end()
endif

" turn on syntax highlighting, auto hybrid numbering, and autoindenting for
" every file
syntax on

set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

set autoindent

" enables plugins and indent scripts based on filetype
filetype plugin indent on

" 8 character tabs and shiftwidth
set tabstop=8
set shiftwidth=8

" inform vim that my terminal has a dark background
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
else
	au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" extends airline to show buffers when there's only one open tab
let g:airline#extensions#tabline#enabled = 1

" sets the airline theme
let g:airline_theme='molokai'

" lets airline see powerline symbols
let g:airline_powerline_fonts = 1

" opens NERDTree automatically on startup
"autocmd vimenter * NERDTree

" if NERDTree is the only open window, close vim
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Make syntax highlighting compatible with limelight
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Default: 0.5
let g:limelight_default_coefficient = 0.7

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1
colorscheme ayu
