setlocal foldmethod=expr
setlocal foldexpr=vimtex#fold#level(v:lnum)
setlocal foldtext=vimtex#fold#text()
nnoremap <silent> <Leader>tt :VimtexTocToggle<CR>
let g:tex_flavor = 'latex'
let g:livepreview_previewer = 'zathura'
let g:vimtex_toc_config = {
	\'split_pos' 	: ':vert :botright',
	\'split_width'	: 50,
	\}

