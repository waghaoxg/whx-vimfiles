" LaTeX filetype
if g:myTexCustomFlag == 0
	if has("unix")
		" do stuff for Unix
	elseif has("win32")
		let s:dictName = 'dictTex'
		let s:dictDir = 'e:\Software\Programming\vim\dictionary\'
		let s:shareDir = 'd:\ShareBox\Software\Programming\vim\dictionary\'
		let s:copyToCmd = '!copy '.s:dictDir.s:dictName.' '.s:shareDir 
		let s:copyFromCmd = '!copy '.s:shareDir.s:dictName.' '.s:dictDir
	endif

	execute s:copyFromCmd
	execute "set dictionary=".s:dictDir.s:dictName
	execute "tab sview ".s:dictDir.s:dictName
	let g:SuperTabDefaultCompletionType = "<c-x><c-k>"
	execute 'autocmd BufWinLeave *.tex '.s:copyToCmd
	nmap <leader>p :!dvipdfm %:r.dvi<cr>

	let g:myTexCustomFlag = 1
endif
