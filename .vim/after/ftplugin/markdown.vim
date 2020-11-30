setlocal foldmethod=marker
setlocal foldmarker={{,}}
inoremap <buffer> <expr> <s-tab> InsertTabWrapper("0")
inoremap <buffer> <expr> <tab> InsertTabWrapper("1")
let g:limelight_mode = 'movement'
let g:limelight_bop = '^'
let g:limelight_eop = '$'
