if has("unix")
	" do stuff for Unix
	let s:dictName = 'dictCMake'
	let s:dictDir = '/home/clickme/software/programming/vim/dictionary/'
elseif has("win32")
	let s:dictName = 'dictCMake'
	let s:dictDir = 'e:\Software\Programming\vim\dictionary\'
endif
execute "set dictionary=".s:dictDir.s:dictName
