" UI
set nu rnu
set ruler
set mouse=a
set title
set splitbelow
set splitright

" Misc
set backspace=indent,eol,start
set backupdir=~/.cache/vim
set confirm
set dir=~/.cache/vim

" Search
set hlsearch
set ignorecase
set smartcase
set path+=**
set wildmenu
set incsearch
set infercase

" Text
set display+=lastline
set encoding=utf-8
set linebreak
set wrap
syntax on
set spelllang=en_us,en_gb
set spell
set ai
set tabstop=4

" Commands
command WC :silent w! /tmp/vimword | :r !echo Word Count: (cat /tmp/vimword | wc -w)
command DATE :r !printf "\%s \%s" "\#\#" (date)

" Bindings
let mapleader= " "
nnoremap <silent> <Leader>y "*y
nnoremap <silent> <Leader>p :r !wl-paste 2>/dev/null<CR>
nnoremap <silent> <Leader>P :r !wl-paste -p 2>/dev/null<CR>
" nnoremap <Leader>Y "+y
" nnoremap <Leader>P "+p
nnoremap ;n :bn<CR>
nnoremap ;p :bp<CR>
nnoremap ;d :bd<CR>
nnoremap ;<Tab> :bn <CR>
nnoremap <silent> ;l :noh <CR> 
nnoremap <Leader>c :r !

" Saving and Quitting
nnoremap \w :w <CR>
nnoremap \q :q<CR>

" Tabs
nnoremap <Tab> gt
nnoremap <Leader><Tab> gT
nnoremap <Leader>t :tabedit
nnoremap <Leader>v :vsplit
nnoremap <Leader>s :split
nnoremap <silent> <Leader><t_KI> :vertical res +5 <CR>
nnoremap <silent> <Leader><t_KG> :vertical res -5 <CR>
nnoremap <silent> <Leader><t_KE> :res -5 <CR>
nnoremap <silent> <Leader><t_KK> :res +5 <CR>
nnoremap <silent> <Leader>r <C-W>R

" Navigation
nnoremap k gk
nnoremap j gj
nnoremap <Leader>h <C-W><C-H>
nnoremap <Leader>j <C-W><C-J>
nnoremap <Leader>k <C-W><C-K>
nnoremap <Leader>l <C-W><C-L>
nnoremap <silent> <Leader>e :Vexplore 15<CR>



" Powerline stuff
" set fillchars+=vert:│
let g:airline_extensions = ["tabline"]

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline#extensions#tabline#enabled = 1

" backups
set backup
set backupdir=~/.vim/backup//
set writebackup
set backupcopy=no
au BufWritePre * let &bex = '@' . strftime("%F.%H:%M")

" Tab autocompletion
function! InsertTabWrapper(arg)
	let col = col('.') - 1
	if !col || getline('.')[col - 1] !~ '\k'
		return "\<tab>"
	else
		if a:arg == "1" 
				return "\<c-p>"
		else
				return "\<c-n>"
		endif
	endif
endfunction

autocmd FileType markdown inoremap <buffer> <expr> <s-tab> InsertTabWrapper("1")
autocmd FileType markdown inoremap <buffer> <expr> <tab> InsertTabWrapper("0")


" LaTeX
let g:tex_flavor = 'latex'
let g:livepreview_previewer = 'zathura'
let g:vimtex_toc_config = {
	\'split_pos' 	: ':vert :botright',
	\'split_width'	: 50,
	\}
autocmd BufEnter *.tex set foldmethod=expr
autocmd BufEnter *.tex set foldexpr=vimtex#fold#level(v:lnum)
autocmd BufEnter *.tex set foldtext=vimtex#fold#text()
nnoremap <silent> <leader>lt :VimtexTocToggle<CR>

" ultrasnips
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsEditSplit="vertical"
" Plugins
call plug#begin()
Plug 'dylanaraps/wal.vim'
Plug 'vim-airline/vim-airline'
Plug 'lervag/vimtex'
Plug 'honza/vim-snippets'
"Plug 'Valloric/YouCompleteMe'
Plug 'SirVer/ultisnips'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
call plug#end()

colorscheme wal

