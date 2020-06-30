" Plugin Keyboard-Mappings
" ---

	nnoremap <silent><LocalLeader>f :<C-u>Clap! files<CR>
	nnoremap <silent><LocalLeader>b :<C-u>Clap! buffers<CR>
	nnoremap <silent><LocalLeader>g :<C-u>Clap! grep<CR>
	nnoremap <silent><LocalLeader>j :<C-u>Clap! jumps<CR>
	nnoremap <silent><LocalLeader>h :<C-u>Clap! help_tags<CR>
	nnoremap <silent><LocalLeader>t :<C-u>Clap! tags<CR>
	nnoremap <silent><LocalLeader>l :<C-u>Clap! loclist<CR>
	nnoremap <silent><LocalLeader>q :<C-u>Clap! quickfix<CR>
	nnoremap <silent><LocalLeader>m :<C-u>Clap! files ~/docs/books<CR>
	nnoremap <silent><LocalLeader>y :<C-u>Clap! yanks<CR>
	nnoremap <silent><LocalLeader>/ :<C-u>Clap! lines<CR>
	nnoremap <silent><LocalLeader>* :<C-u>Clap! lines ++query=<cword><CR>
	nnoremap <silent><LocalLeader>; :<C-u>Clap! command_history<CR>

	" nnoremap <silent><Leader>gl :<C-u>Clap! commits<CR>
	" nnoremap <silent><Leader>gt :<C-u>Clap! tags ++query=<cword><CR>
	" xnoremap <silent><Leader>gt :<C-u>Clap! tags ++query=@visual<CR><CR>
	nnoremap <silent><Leader>gf :<C-u>Clap! files ++query=<cword><CR>
	xnoremap <silent><Leader>gf :<C-u>Clap! files ++query=@visual<CR><CR>
	nnoremap <silent><Leader>gg :<C-u>Clap! grep ++query=<cword><CR>
	xnoremap <silent><Leader>gg :<C-u>Clap! grep ++query=@visual<CR><CR>

	autocmd user_events FileType clap_input call s:clap_mappings()

	function! s:clap_mappings()
		nnoremap <silent> <buffer> <nowait>' :call clap#handler#tab_action()<CR>
		inoremap <silent> <buffer> <Tab>   <C-R>=clap#navigation#linewise('down')<CR>
		inoremap <silent> <buffer> <S-Tab> <C-R>=clap#navigation#linewise('up')<CR>
		nnoremap <silent> <buffer> <C-f> :<c-u>call clap#navigation#scroll('down')<CR>
		nnoremap <silent> <buffer> <C-b> :<c-u>call clap#navigation#scroll('up')<CR>

		nnoremap <silent> <buffer> sg  :<c-u>call clap#handler#try_open('ctrl-v')<CR>
		nnoremap <silent> <buffer> sv  :<c-u>call clap#handler#try_open('ctrl-x')<CR>
		nnoremap <silent> <buffer> st  :<c-u>call clap#handler#try_open('ctrl-t')<CR>

		nnoremap <silent> <buffer> q     :<c-u>call clap#handler#exit()<CR>
		nnoremap <silent> <buffer> <Esc> :call clap#handler#exit()<CR>
		inoremap <silent> <buffer> <Esc> <C-R>=clap#navigation#linewise('down')<CR><C-R>=clap#navigation#linewise('up')<CR><Esc>
		inoremap <silent> <buffer> jj    <C-R>=clap#navigation#linewise('down')<CR><C-R>=clap#navigation#linewise('up')<CR><Esc>
	endfunction

	function! s:get_selection(cmdtype)
		let temp = @s
		normal! gv"sy
		let @/ = substitute(escape(@s, '\' . a:cmdtype), '\n', '\\n', 'g')
		let @s = temp
	endfunction

	" Close preview window with Escape key
	autocmd user_events User lsp_float_opened nmap <buffer> <silent> <Esc>
		\ <Plug>(lsp-preview-close)
	autocmd user_events User lsp_float_closed nunmap <buffer> <Esc>

	nnoremap <silent> <LocalLeader>e
		\ :<C-u>Defx -toggle `getcwd()` -buffer-name=tab`tabpagenr()`<CR>
	nnoremap <silent> <LocalLeader>a
		\ :<C-u>Defx `getcwd()` -search=`expand('%:p')` -buffer-name=tab`tabpagenr()`<CR>

	imap <buffer><expr> <C-Tab> delimitMate#JumpAny()

	nmap <silent> [c <Plug>(ale_previous)
	nmap <silent> ]c <Plug>(ale_next)

	nnoremap <silent> <Leader>b :<C-u>Vista<CR>
	nnoremap <silent> <Leader>a :<C-u>Vista show<CR>

	autocmd user_events FileType html,css,javascript,javascriptreact
		\ EmmetInstall
		\ | imap <buffer> <C-Return> <Plug>(emmet-expand-abbr)

	nmap ]g <Plug>(GitGutterNextHunk)
	nmap [g <Plug>(GitGutterPrevHunk)
	nmap gS <Plug>(GitGutterStageHunk)
	xmap gS <Plug>(GitGutterStageHunk)
	nmap <Leader>gr <Plug>(GitGutterUndoHunk)
	nmap gs <Plug>(GitGutterPreviewHunk)

	nmap <silent><Leader>tc :<C-u>ContextEnableWindow<CR>
	nmap <silent><Leader>tp :<C-u>ContextPeek<CR>

	autocmd user_events FileType go
		\   nmap <C-]> <Plug>(go-def)
		\ | nmap <Leader>god  <Plug>(go-describe)
		\ | nmap <Leader>goc  <Plug>(go-callees)
		\ | nmap <Leader>goC  <Plug>(go-callers)
		\ | nmap <Leader>goi  <Plug>(go-info)
		\ | nmap <Leader>gom  <Plug>(go-implements)
		\ | nmap <Leader>gos  <Plug>(go-callstack)
		\ | nmap <Leader>goe  <Plug>(go-referrers)
		\ | nmap <Leader>gor  <Plug>(go-run)
		\ | nmap <Leader>gov  <Plug>(go-vet)

	nmap <silent> <Leader>rr :<C-u>IronRepl<CR><Esc>
	nmap <silent> <Leader>rq <Plug>(iron-exit)
	nmap <silent> <Leader>rl <Plug>(iron-send-line)
	vmap <silent> <Leader>rl <Plug>(iron-visual-send)
	nmap <silent> <Leader>rp <Plug>(iron-repeat-cmd)
	nmap <silent> <Leader>rc <Plug>(iron-clear)
	nmap <silent> <Leader>r<CR>  <Plug>(iron-cr)
	nmap <silent> <Leader>r<Esc> <Plug>(iron-interrupt)

	nmap <silent> sa <Plug>(operator-sandwich-add)
	xmap <silent> sa <Plug>(operator-sandwich-add)
	omap <silent> sa <Plug>(operator-sandwich-g@)
	nmap <silent> sd <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
	xmap <silent> sd <Plug>(operator-sandwich-delete)
	nmap <silent> sr <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
	xmap <silent> sr <Plug>(operator-sandwich-replace)
	nmap <silent> sdb <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
	nmap <silent> srb <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
	omap ib <Plug>(textobj-sandwich-auto-i)
	xmap ib <Plug>(textobj-sandwich-auto-i)
	omap ab <Plug>(textobj-sandwich-auto-a)
	xmap ab <Plug>(textobj-sandwich-auto-a)
	omap is <Plug>(textobj-sandwich-query-i)
	xmap is <Plug>(textobj-sandwich-query-i)
	omap as <Plug>(textobj-sandwich-query-a)
	xmap as <Plug>(textobj-sandwich-query-a)

	xmap p <Plug>(operator-replace)

	silent! xmap I  <Plug>(niceblock-I)
	silent! xmap gI <Plug>(niceblock-gI)
	silent! xmap A  <Plug>(niceblock-A)

	nmap <silent> j <Plug>(accelerated_jk_gj)
	nmap <silent> k <Plug>(accelerated_jk_gk)

	map gj <Plug>(edgemotion-j)
	map gk <Plug>(edgemotion-k)
	xmap gj <Plug>(edgemotion-j)
	xmap gk <Plug>(edgemotion-k)

	nmap <Leader>mt <Plug>(quickhl-manual-this)
	xmap <Leader>mt <Plug>(quickhl-manual-this)

	nmap <Leader>l <Plug>(sidemenu)
	xmap <Leader>l <Plug>(sidemenu-visual)

	nmap <silent><Leader>ti :<C-u>IndentGuidesToggle<CR>

	let g:SignatureIncludeMarks = 'abcdefghijkloqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
	let g:SignatureMap = {
		\ 'Leader':            'm',
		\ 'ListBufferMarks':   'm/',
		\ 'ListBufferMarkers': 'm?',
		\ 'PlaceNextMark':     'm,',
		\ 'ToggleMarkAtLine':  'mm',
		\ 'PurgeMarksAtLine':  'm-',
		\ 'DeleteMark':        'dm',
		\ 'PurgeMarks':        'm<Space>',
		\ 'PurgeMarkers':      'm<BS>',
		\ 'GotoNextLineAlpha': "']",
		\ 'GotoPrevLineAlpha': "'[",
		\ 'GotoNextSpotAlpha': '`]',
		\ 'GotoPrevSpotAlpha': '`[',
		\ 'GotoNextLineByPos': "]'",
		\ 'GotoPrevLineByPos': "['",
		\ 'GotoNextSpotByPos': 'mn',
		\ 'GotoPrevSpotByPos': 'mp',
		\ 'GotoNextMarker':    ']-',
		\ 'GotoPrevMarker':    '[-',
		\ 'GotoNextMarkerAny': ']=',
		\ 'GotoPrevMarkerAny': '[=',
		\ }

	autocmd user_events FileType gitrebase
		\  nmap <buffer><CR>  <Plug>(auto_git_diff_scroll_manual_update)
		\| nmap <buffer><C-n> <Plug>(auto_git_diff_scroll_down_page)
		\| nmap <buffer><C-p> <Plug>(auto_git_diff_scroll_up_page)
		\| nmap <buffer><C-d> <Plug>(auto_git_diff_scroll_down_half)
		\| nmap <buffer><C-u> <Plug>(auto_git_diff_scroll_up_half)

	let g:committia_hooks = {}
	function! g:committia_hooks.edit_open(info)
		imap <buffer><C-d> <Plug>(committia-scroll-diff-down-half)
		imap <buffer><C-u> <Plug>(committia-scroll-diff-up-half)

		setlocal winminheight=1 winheight=1
		resize 10
		startinsert
	endfunction

	autocmd user_events FileType python
		\ nmap <buffer> {{ [%
		\ | nmap <buffer> }} ]%

	nnoremap <Leader>G :Goyo<CR>

	nnoremap <silent> <Leader>W :<C-u>VimwikiIndex<CR>

	nmap -         <Plug>(choosewin)
	nmap <Leader>- :<C-u>ChooseWinSwapStay<CR>

	nnoremap <silent> <Leader>mg :Magit<CR>

	nnoremap <silent> <leader>ga :Git add %:p<CR>
	nnoremap <silent> <leader>gd :Gdiffsplit<CR>
	nnoremap <silent> <leader>gc :Git commit<CR>
	nnoremap <silent> <leader>gb :Git blame<CR>
	nnoremap <silent> <leader>gF :Gfetch<CR>
	nnoremap <silent> <leader>gS :Git<CR>
	nnoremap <silent> <leader>gp :Gpush<CR>

	nmap <Leader>gv :GV! --all<cr>
	vmap <Leader>gv :GV! --all<cr>

	nmap <leader>n  <Plug>(altr-forward)
	nmap <leader>N  <Plug>(altr-back)

	nnoremap <Leader>gu :UndotreeToggle<CR>

	nnoremap <silent> <Leader>K :<C-u>ThesaurusQueryReplaceCurrentWord<CR>

	xmap v <Plug>(expand_region_expand)
	xmap V <Plug>(expand_region_shrink)

	nnoremap <silent> <, :SidewaysLeft<CR>
	nnoremap <silent> >, :SidewaysRight<CR>
	nnoremap <silent> [, :SidewaysJumpLeft<CR>
	nnoremap <silent> ], :SidewaysJumpRight<CR>
	omap <silent> a, <Plug>SidewaysArgumentTextobjA
	xmap <silent> a, <Plug>SidewaysArgumentTextobjA
	omap <silent> i, <Plug>SidewaysArgumentTextobjI
	xmap <silent> i, <Plug>SidewaysArgumentTextobjI

	let g:splitjoin_join_mapping = ''
	let g:splitjoin_split_mapping = ''
	nmap sj :SplitjoinJoin<CR>
	nmap sk :SplitjoinSplit<CR>

	vnoremap <Leader>mdf :Linediff<CR>
	vnoremap <Leader>mda :LinediffAdd<CR>
	nnoremap <Leader>mds :<C-u>LinediffShow<CR>
	nnoremap <Leader>mdr :<C-u>LinediffReset<CR>

	nmap dsf <Plug>DsfDelete
	nmap csf <Plug>DsfChange

	omap <silent> ab <Plug>(textobj-multiblock-a)
	omap <silent> ib <Plug>(textobj-multiblock-i)
	xmap <silent> ab <Plug>(textobj-multiblock-a)
	xmap <silent> ib <Plug>(textobj-multiblock-i)

	omap <silent> af <Plug>(textobj-function-a)
	omap <silent> if <Plug>(textobj-function-i)
	xmap <silent> af <Plug>(textobj-function-a)
	xmap <silent> if <Plug>(textobj-function-i)

	let g:UltiSnipsExpandTrigger="sn"

" Intellj Like mapping
nnoremap <silent><A-1> :NERDTreeToggle<CR>
nnoremap <silent><C-S-l> :ALEFix<CR>

" vim: set ts=2 sw=2 tw=80 noet :
