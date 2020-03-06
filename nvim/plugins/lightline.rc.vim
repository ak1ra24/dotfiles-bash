let g:lightline = {
  \ 'colorscheme': 'dracula',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ], 
  \             [ 'readonly', 'modified', 'fugitive', 'filename' ],
  \             [ 'vista' ],
  \           ],
  \   'right': [ [ 'lineinfo' ],
  \              [ 'percent' ],
  \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
  \ },
  \ 'component_function': {
  \   'readonly': 'LightlineReadonly',
  \   'modified': 'LightlineModified',
  \   'fugitive': 'LightlineFugitive',
  \   'vista': 'NearestMethodOrFunction',
  \ },
  \ 'component_function_visible_condition': {
  \   'mode': 1,
  \ },
  \ 'component_expand': {
  \   'ale_error': 'LightLineAleError',
  \   'ale_warning': 'LightLineAleWarning',
  \   'ale_ok': 'LightLineAleOk',
  \ },
  \ 'component_type': {
  \   'ale_error': 'error',
  \   'ale_waring': 'waring',
  \   'ale_ok': 'ok',
  \ }
\ }

function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

augroup LightLineOnALE
  autocmd!
  autocmd User ALELint call lightline#update()
augroup END
function! LightlineModified()
  if &filetype == 'help'
    return ''
  elseif &modified
    return '+'
  elseif &modifiable
    return ''
  else
    return '-'
  endif
endfunction

function! LightlineReadonly()
  if &filetype == 'help'
    return ''
  elseif &readonly
    return 'x'
  else
    return ''
  endif
endfunction

function! LightlineFugitive()
  return exists('*fugitive#head') ? fugitive#head() : ''
endfunction
function! LightLineAleError() abort
	return s:ale_string(0)
endfunction
function! LightLineAleWarning() abort
	return s:ale_string(1)
endfunction
function! LightLineAleOk() abort
	return s:ale_string(2)
endfunction
function! s:ale_string(mode)
	if !exists('g:ale_buffer_info')
		return ''
	endif
	let l:buffer = bufnr('%')
	let l:counts = ale#statusline#Count(l:buffer)
	let [l:error_format, l:warning_format, l:no_errors] = g:ale_statusline_format
	if a:mode == 0 " Error
		let l:errors = l:counts.error + l:counts.style_error
		return l:errors ? printf(l:error_format, l:errors) : ''
	elseif a:mode == 1 " Warning
		let l:warnings = l:counts.warning + l:counts.style_warning
		return l:warnings ? printf(l:warning_format, l:warnings) : ''
	endif
	return l:counts.total == 0? l:no_errors: ''
endfunction
" # show statusbar
set laststatus=2
" # hide --INSERT--
set noshowmode
