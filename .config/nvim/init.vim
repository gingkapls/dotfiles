" vim:fdm=marker:fmr={{{,}}}

" UI {{{
set nu
set rnu
set mouse=a
set title
set splitbelow
set splitright
set listchars=tab:\┆\ 
set list
set conceallevel=2
set nocursorline
set nocursorcolumn
set scrolljump=5
set lazyredraw
" }}}
" Search {{{
set ignorecase
set smartcase
set infercase
autocmd InsertEnter * :setlocal nohlsearch
autocmd InsertLeave * :setlocal hlsearch
" }}}
" Text {{{
set display+=truncate
set linebreak
set wrap
syntax on
set spelllang=en_us,en_gb
set spell
set ai
set tabstop=4
set shiftwidth=4
set scrolloff=999
set smartindent
" }}}
" Commands  {{{
command WC :r !echo Word Count: (wc -w < %)
command DATE :r !printf "\%s \%s" "\#\#" (date)
command! -nargs=1 Silent
			\   execute 'silent !' . <q-args>
			\ | execute 'redraw!'
" }}}
" Shell commands in scratch window {{{
command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
  let isfirst = 1
  let words = []
  for word in split(a:cmdline)
    if isfirst
      let isfirst = 0  " don't change first word (shell command)
    else
      if word[0] =~ '\v[%#<]'
        let word = expand(word)
      endif
      let word = shellescape(word, 1)
    endif
    call add(words, word)
  endfor
  let expanded_cmdline = join(words)
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(1, 'You entered:  ' . a:cmdline)
  call setline(2, 'Expanded to:  ' . expanded_cmdline)
  call append(line('$'), substitute(getline(2), '.', '=', 'g'))
  silent execute '$read !'. expanded_cmdline
  1
endfunction
" }}}
" Copy to Clipboard {{{
function Test() range 
  let current_pos = getpos(".")
  echo system('echo '.shellescape(join(getline(a:firstline, a:lastline), "\r")).'| wl-copy')
  echo "yanked to clipboard"
  call setpos(".", current_pos)
endfunction
" }}}
" Bindings: General {{{
let mapleader= " "
vnoremap <Leader>y :'<,'> call Test() <CR>
vnoremap <C-r> "hy:%s/<C-r>h//g<left><left>
nnoremap <silent> <Leader>p :r !wl-paste -p --no-newline 2>/dev/null<CR>
nnoremap <silent> <Leader>P :r !wl-paste --no-newline 2>/dev/null<CR>
inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>0
nmap Y y$
vnoremap <Leader>n :!nl -bt <CR>
" }}}
" Bindings: Buffers {{{
nnoremap ;n :bn<CR>
nnoremap ;p :bp<CR>
nnoremap ;d :bd<CR>
nnoremap ;<Tab> :bn <CR>
nnoremap <silent> ;l :noh <CR> 
nnoremap <Leader>c :r !
nnoremap <Leader>g :Goyo <CR>
nnoremap <Leader>z xu/<C-R>-<CR>
nnoremap <Leader>x xu:%s/<C-R>-//g<CR>
vnoremap <Leader>x xu:%s/<C-R>-//g<CR>
nnoremap <Leader>. )i<BS><CR><ESC><C-o>
nnoremap \w :w <CR>
nnoremap \q :q<CR>

" Fix netrw toggling
augroup AutoDeleteNetrwHiddenBuffers
  au!
  au FileType netrw setlocal bufhidden=wipe
augroup end
" }}}
" Bindings: Navigation {{{
nnoremap k gk
nnoremap j gj
nnoremap <Leader>h <C-W><C-H>
nnoremap <Leader>j <C-W><C-J>
nnoremap <Leader>k <C-W><C-K>
nnoremap <Leader>l <C-W><C-L>
nnoremap <silent> <Leader>e :Lexplore 30<CR>
" }}}
" Bindings: Tabs {{{
nnoremap <Leader><Tab> gT
nnoremap <Leader>t :tabedit
nnoremap <Leader>v :vsplit
nnoremap <Leader>s :split
nnoremap <silent> <Leader><t_KI> :vertical res +5 <CR>
nnoremap <silent> <Leader><t_KG> :vertical res -5 <CR>
nnoremap <silent> <Leader><t_KE> :res -5 <CR>
nnoremap <silent> <Leader><t_KK> :res +5 <CR>
nnoremap <silent> <Leader>r <C-W>R
" }}}
" Bindings: Popupmenu {{{
inoremap <expr> <Esc> pumvisible() ? "\<C-e>" : "\<Esc>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<Tab>"
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
" }}}
" Airline  {{{
let g:airline_extensions = ["tabline"]
let g:airline_theme = 'base16'
" }}}
" air-line {{{
let g:airline_powerline_fonts = 1
let g:airline_highlighting_cache = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" }}}
" unicode symbols {{{
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
" }}}
" airline symbols {{{
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline#extensions#tabline#enabled = 1
" }}}
" Backups  {{{
set backup
set backupdir=~/.local/share/nvim/backup/
set dir=~/.local/share/nvim/swap/
set writebackup
set backupcopy=no
au BufWritePre * let &bex = '@' . strftime("%F.%H:%M")
set confirm
" }}}
" Limelight {{{
autocmd! User GoyoEnter Limelight0.6
autocmd! User GoyoLeave Limelight!
" }}}
" Folds  {{{
autocmd BufWinLeave *.* mkview!
autocmd BufWinEnter *.* silent! loadview
nnoremap <Leader><Leader> za
let g:markdown_folding = 1
set fillchars+=fold:\ 
" }}}
" Deoplete && Snippets{{{
let g:deoplete#enable_at_startup = 1
" }}}
" Plugins  {{{
call plug#begin(stdpath('data') . '/plugged')
Plug 'vim-airline/vim-airline'
Plug 'lervag/vimtex', { 'for': 'tex' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
call plug#end()
" }}}
" Colors {{{
" colorscheme base16-transparent
colorscheme base16-generated
" }}}
