let $LC_ALL='en_US.UTF-8'
let $LANG='en_US.UTF-8' " set the environment as English
let $LC_MESSAGES='en' " set message as English
set langmenu=none " set menu as English


filetype plugin on
"for nerd commemter
"""""""""""""""""""""""""""""""""""""""""""""""""""""
"" to automatically spell for specific file types
"""""""""""""""""""""""""""""""""""""""""""""""""""""
"au BufNewFile,BufRead *.txt,*.tex set spell spelllang=en_us
au BufNewFile,BufRead *.tex set spell spelllang=en_us

"""""""""""""""""""""""""""""""""""""""
"" Full-screen mode
"""""""""""""""""""""""""""""""""""""""
"if has("gui_win32")       " NT Windows
	"autocmd GUIEnter * :simalt ~x
"endif

"""""""""""""""""""""""""""""""""""""""""
"" Colors
"""""""""""""""""""""""""""""""""""""""""
if ! has("gui_running") 
  set t_Co=256
endif 
set background=dark
"colo peaksea
"colo tir_black
colo lucius
"colo xoria256
"colo wombat256

""""""""""""""""""""""""""""""""""""""""""
"" For Backup
""""""""""""""""""""""""""""""""""""""""""
set backup
"set nobackup
set backupdir=~/.Trash,.

""""""""""""""""""""""""""""""""""""""""""
"" Codings
""""""""""""""""""""""""""""""""""""""""""
set fileencodings=utf-8,big5,euc-jp,gbk,euc-kr,utf-bom,iso8859-1
set encoding=utf-8
set termencoding=utf-8
"set termencoding=big5

""""""""""""""""""""""""""""""""""""""""""""""""
"" for Folding
""""""""""""""""""""""""""""""""""""""""""""""
set foldcolumn=2
"set foldmethod=expr
"set foldtext=/^/=>

""""""""""""""""""""""""""""""""""""""""""""""
"" Tab for programming
""""""""""""""""""""""""""""""""""""""""""""""
set smarttab
set expandtab
set autoindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set showtabline=2
set formatoptions=croql
"set paste
""""""""""""""""""""""""""""""""""""""""""""""
"" Environment Settings
""""""""""""""""""""""""""""""""""""""""""""""
"set backspace=indent,eol,start
"set bs=2 "" allow backspacing over everything in insert mode
"set history=50 "" keep 50 lines of command line history
"set ruler "" show the cursor position all the time
"set showcmd "" display incomplete commands
"set incsearch "" jumps to search word as you type (annoying but excellent)
set wildignore=*.o,*.obj,*.exe,*.class,*.dvi,*.aux,*.log,*.ps,*.jpg,*.nav,*.snm,*.toc
set nohls
"set showmatch "" Show matching parenthese.
"set clipboard=unnamed	"" for copy and paste compatible with win32
"set wildmenu
set laststatus=2 "" Display a status-bar.
set statusline=[%F]\ [%{&encoding},%{&fileformat}]%=\ %y\ [%P]\ [%l,\ %c]\ [LEN=%L]
"set laststatus=2
"set statusline=%4*%<\ %1*[%F]
"set statusline+=%4*\ %5*[%{&encoding}, " encoding
"set statusline+=%{&fileformat}]%m " file format
"set statusline+=%4*%=\ %6*%y%4*\ %3*[%l%4*,\ %3*%c]%4*\ %2*\<\%P\>%4*
"highlight User1 ctermfg=red
"highlight User2 ctermfg=green
"highlight User3 ctermfg=yellow
"highlight User4 term=underline cterm=underline ctermfg=green
"highlight User5 ctermfg=cyan
"highlight User6 ctermfg=white
"set viminfo='20,\"50	"" read/write a .viminfo file, don't store more
set textwidth=70
set nowrap "" no wrap the text if a text is long
"set guioptions-=T " Turn off useless toolbar
"set guioptions-=m " Turn off menu bar
"set guioptions-=r " Turn off right-hand scroll-bar
set guifont=Monaco:h14
"set guifont=Anonymous:h12
"set guifont=Consolas:h16
set number "" show the number of lines
set ch=1 "" Make command line two lines high
set ignorecase
set smartcase

""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Automatically change the current directory into 
"" the directory of the current buffer
""""""""""""""""""""""""""""""""""""""""""""""""""""
"set bsdir=buffer "" to let the current directory be the directory of buffer
"set autochdir "" automatically change the current directory
autocmd BufEnter * lcd %:p:h

"""""""""""""""""""""""""""""""""""""""""""""""""
"" Copy and paste for Ubuntu
"""""""""""""""""""""""""""""""""""""""""""""""""
vmap <C-c> "+y
nmap <C-c> "+y
vmap <C-v> "+gp
nmap <C-v> "+gp

