function Ccompile()
	silent write
	Shell make %:r
endfunction

nnoremap <Leader>c :call Ccompile()<CR>

