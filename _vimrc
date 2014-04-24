"---------------------- general----------------------
set nocompatible
if has("win32")
	source $VIMRUNTIME/vimrc_example.vim
" source $VIMRUNTIME/mswin.vim  don't use Ctrl+C Ctrl+V ...
	behave mswin
"	nmap <silent> <c-Enter> :call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<cr>
    set guifont=consolas:h11
elseif has("unix")
    set guifont=Droid\ Sans\ Mono\ 10
    "set guifont=DejaVu\ Sans\ Mono\ 11
	syntax on
	set showcmd
endif
filetype plugin on
set ignorecase
set smartcase
set nu
colorscheme molokai
set tabstop=4
set shiftwidth=4
let mapleader = ","
set backupdir=$HOME/vimbackupfiles//,.,
set hlsearch
set wildmode=full
set wildmenu
set fileencodings=utf-8,cp936,ucs-bom
set wildignorecase
set wmh=0
set wmw=0

"---------------------- set the menu & the message to English----------
set langmenu=en_US
let $LANG = 'en_US'
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

"--------------edit vimrc------------------
nmap <F12> :vs $MYVIMRC<cr>

"--------------auto makeSession------------------
"autocmd VimLeave * call whx#autoMKSession#AutoMKS()
nmap <silent> <leader>s :call whx#autoMKSession#AutoMKS()<cr>

"--------------layout------------------
nmap <silent> <C-w>x :resize 9999\|vert resize 9999<cr>

"--------------gui------------------
set guioptions-=m
set guioptions-=T
map <silent> <F2> :if &guioptions =~# 'm' <Bar>
        \set guioptions-=m <bar>
    \else <Bar>
        \set guioptions+=m <Bar>
    \endif<CR>

set guioptions+=c
set guioptions-=e

"--------------navigation------------------
"imap <A-h> <ESC>ha
"imap <A-j> <ESC>gja
"imap <A-k> <ESC>gka
"imap <A-l> <ESC>la
imap <C-h> <ESC>bi
imap <C-l> <ESC>lwi
imap <C-b> <ESC><S-i>
imap <C-e> <ESC><S-a>
"--------------Key mapping------------------
if has("unix")
	map  <C-Insert> "+y 
endif

"--------------coding------------------
map <S-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q

"--------------supertab------------------
if has("win32")
	let g:SuperTabDefaultCompletionType = "context"
endif

"--------------cscope------------------
if has("win32")
	set csprg=mlcscope
	set cscopequickfix=s-,c-,d-,i-,t-,e-,g-,f-
	set ic
endif

"--------------------pathogen----------------------
call pathogen#infect()

"---------------------vim latex -------------------------
let g:myTexCustomFlag = 0
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
if has("win32")
	set grepprg=findstr\ /n\ /S\ $* 
elseif has("unix")
	set grepprg=grep\ -nrH\ --exclude=Session.vim\ --exclude=viminfo\ $*
endif

" OPTIONAL: This enables automatic indentation as you type.  
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat = 'pdf'
if has("win32")
	let g:Tex_ViewRule_pdf =  '"d:\Program Files\SumatraPDF\SumatraPDF.exe" -reuse-instance'
elseif has("unix")
	let g:Tex_ViewRule_pdf =  'evince'
	let g:Tex_GotoError=0
endif
 
"--------------------- clang_completion-------------------------
if has("win32")
	let g:clang_exec = 'd:\Program Files\LLVM\bin\clang.exe'
	let g:clang_user_options = '2> NUL || exit 0'
	let g:clang_library_path = 'd:\Program Files\LLVM\bin'

	"let g:clang_use_library = 1
	"let g:clang_hl_errors=1
	"let g:clang_complete_copen = 1
	let g:clang_complete_copen=1
	let g:clang_periodic_quickfix=1
	let g:clang_snippets=1
	let g:clang_close_preview=1
	let g:clang_use_library=1
	let g:clang_user_options='-stdlib=libstdc++ -std=c++11 -I/usr/include'
elseif has("unix")
endif
"---------------------YouCompleteMe-------------------------
"if has("unix")
	nnoremap <c-k> :YcmCompleter GoToDefinitionElseDeclaration<CR>
	"g:ycm_global_ycm_extra_conf = '/home/...'   "put the default .ycm_extra_conf.py
	let g:ycm_autoclose_preview_window_after_completion = 1 "for preview window
	"let g:ycm_autoclose_preview_window_after_insertion = 1 "for preview window
	"
	"disable preview window
	"set completeopt-=preview 
	"g:ycm_add_preview_to_completeopt = 0
	let g:ycm_filetype_blacklist = {
	        \ 'tagbar' : 1,
	        \ 'qf' : 1,
	        \ 'notes' : 1,
	        \ 'markdown' : 1,
	        \ 'unite' : 1,
	        \ 'vimwiki' : 1,
	        \ 'pandoc' : 1
	        \}
	        "\ 'text' : 1,
	let g:ycm_filetype_specific_completion_to_disable = {
			\ 'text' : 1,
			\}
"endif

"---------------------sticky notes-------------------------
"if has("win32")
"	map <silent> <leader>k :so $HOME\tempNotes.vim<cr>
"endif
"--------------------- ctrlp-------------------------
let g:ctrlp_map = '<leader>k'
let g:ctrlp_by_filename = 0
let g:ctrlp_regexp = 1
let g:ctrlp_cmd = 'CtrlPMRUFiles'
let g:ctrlp_mruf_case_sensitive = 0
nmap <leader>b :CtrlPBuffer<cr>
nmap <leader>f :CtrlP<cr>
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:100,results:150'
let g:ctrlp_extensions = ['dir']

"--------------------- netrw-------------------------
let g:netrw_altv          = 1
let g:netrw_fastbrowse    = 2
let g:netrw_keepdir       = 0
let g:netrw_liststyle     = 0 "one file per line
let g:netrw_retmap        = 1
let g:netrw_silent        = 1
let g:netrw_special_syntax= 1
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro' "show nu

"--------------------- mingw-------------------------
if has("win32")
	set makeprg=mingw32-make
endif
"--------------------- pyclewn-------------------------
nmap <F9> :Cbreak
nmap <F10> :Cnext<cr>
nmap <F11> :Cstep<cr>
nmap <F5> :Ccontinue<cr>
nmap <F8> :Cwatch

"--------------------- vimdiff-------------------------
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

"--------------------- vimwiki-------------------------
if has("win32")
let wiki_2 = {}
let wiki_2.path = 'e:\Codes\SIRFS\SIRFS_notes_wiki\'

let wiki_3 = {}
let wiki_3.path = 'e:\Codes\intrinsic_image\nonlocal_texture_constraints\notes_wiki'


let g:vimwiki_list = [{},wiki_2,wiki_3]

elseif has("unix")
endif

"--------------------- xclip -------------------------
"if has("win32")
"	nmap <leader>j :!echo %:p:h \| xclip -sel c
"endif
"--------------------- temp-------------------------
map <F7> :!clang

"-------------------- env path -------------------------------
if has("win32")
elseif has("unix")
	let $LD_LIBRARY_PATH="/usr/local/lib"
endif
"---------------------------Taglist------------------------
let Tlist_Use_Right_Window = 1

"---------------------------closing------------------------
inoremap {}      {}<++><Left><Left><Left><Left><Left>
inoremap []      []<++><Left><Left><Left><Left><Left>
inoremap ()      ()<++><Left><Left><Left><Left><Left>
inoremap <>      <><++><Left><Left><Left><Left><Left>
inoremap ''      ''<++><Left><Left><Left><Left><Left>
inoremap ""      ""<++><Left><Left><Left><Left><Left>

"---------------------------only for first time------------------------
" if has("win32")
" 	if !isdirectory($HOME."/deleting")
" 		call mkdir($HOME."/deleting")
" 	endif
" 	if !isdirectory($HOME."/vimbackupfiles")
" 		call mkdir($HOME."/vimbackupfiles")
" 	endif
" 	if !filereadable($HOME.'\tempNotes.txt')
" 		execute "e ".$HOME.'\tempNotes.txt'
" 		execute "mks! ". $HOME.'\tempNotes.vim'
" 		execute "w ".$HOME.'\tempNotes.txt'
" 		execute "new ". $HOME.'\tempNotesx.vim'
" 		execute "normal ddIset foldmethod=marker"
" 		execute "wq ". $HOME.'\tempNotesx.vim'
" 	endif
" 	let g:Tex_ViewRule_pdf = '"d:\Program Files\SumatraPDF\SumatraPDF.exe" -reuse-instance -inverse-search "d:\Program Files\Vim\vim73\gvim.exe -c \":RemoteOpen +\%l \%f\""'
" endif
