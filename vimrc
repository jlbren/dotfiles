
"breaks vi compatibility to enable the cool shit
set nocompatible
"enable mouse clicks
set mouse=a
"enable plugins to auto indent
filetype plugin indent on
"enable better syntax highlighting
syntax on
"show line numbers
"set number

"disable autocommenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"vim plug stuff
call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'vim-syntastic/syntastic'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
Plug 'majutsushi/tagbar'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-scripts/a.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'Raimondi/delimitMate'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-surround'
Plug 'Valloric/YouCompleteMe', {'do': './install.py --clang-completer'}
call plug#end()

"set background=dark
"Always show statusbar
set laststatus=2
"enabled patched fonts
let g:airline_powerline_fonts=1
"show PASTE if in paste mode
let g:airline_detect_paste=1
"show airline for tabs
let g:airline#extensions#tabline#enabled=1
"Open/close nerdtree tabs with \t
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
"always open nerdtree on start
"let g:nerdtree_tas_open_on_console_startup=1
"set theme
colorscheme molokai
let g:ariline_theme='monokai'
set t_Co=256
"let g:molokai_original = 1
if &term =~ '256color'
	" disable Background Color Erase (BCE) so that color schemes
	" render properly when inside 256-color tmux and GNU screen.
	" see also http://snk.tuxfamily.org/log/vim-256color-bce.html
	set t_ut=
endif

"sign column stuff
"hi clear SignColumn

" ----- scrooloose/syntastic settings -----
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
augroup mySyntastic
	au!
	au FileType tex let b:syntastic_mode = "passive"
augroup END

" ----- xolox/vim-easytags settings -----
" Where to look for tags files
set tags=./tags;,~/.vimtags
" Sensible defaults
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1

" ----- majutsushi/tagbar settings -----
" Open/close tagbar with \b
nmap <silent> <leader>b :TagbarToggle<CR>
"Open tagbar automatically whenever possible
"autocmd BufEnter * nested :call tagbar#autoopen(0)

" ----- airblade/vim-gitgutter settings -----
" In vim-airline, only display "hunks" if the diff is non-zero
let g:airline#extensions#hunks#non_zero_only = 1

" ----- Raimondi/delimitMate settings -----
let delimitMate_expand_cr = 1
augroup mydelimitMate
	  au!
	    au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
	      au FileType tex let b:delimitMate_quotes = ""
	        au FileType tex let b:delimitMate_matchpairs =
		"(:),[:],{:},`:'"
		  au FileType python let b:delimitMate_nesting_quotes = ['"',
		  "'"]
	  augroup END

"ycm global conf
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_python_binary_path = 'python3'

"syntastic recommended settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"syntastic checkers
let g:syntastic_c_checkers=['make','pylint','javac']
"shut up annoying syntastic messages
let g:syntastic_quiet_messages={'regex':'docstring'}
