" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten " everytime an upgrade of the vim packages is performed.  It is recommended to " make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the
" following enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden             " Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)
" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif
" tab settings
" set expandtab
set tabstop=4
" Custom options
" indentation
set autoindent
set smartindent
set t_Co=256
" color scheme that works well with dark or light backgrounds
"colorscheme delek
"colorscheme relaxedgreen
colorscheme colorful256
" peaksea
" if ! has("gui_running")
"     set t_Co=256
" endif
" " set background=light gives a different style, feel free to choose between them.
" set background=dark
" colors peaksea 
" K&R style
"set cinoptions=:0,p0,t0
" Documentation/CodingStyle
set cinoptions=:0,l1,t0,g0,(0
" comment style
set formatoptions=tcqlron
" configure split behavior
"set splitright
" highlight searches
set hlsearch
" vimdiff
if &diff
"if 1
	if ! has("gui_running")
		"set t_Co=256
		set background=dark
	endif
	colorscheme peaksea
endif
" -------------------------------------
" taglist toggle
" -------------------------------------
nnoremap <silent> <F8> :TlistToggle<CR>
let Tlist_Inc_Winwidth = 0
"let Tlist_Show_One_File = 1
let Tlist_File_Fold_Auto_Close = 1
" -------------------------------------
"Dynamic Keyword Highlighting

"smart indent
"inoremap <CR> <C-R>=SmartIndent()<CR>
"inoremap <C-J> <C-R>=SmartIndent()<CR>

" -------------------------------------
" NERDTree toggle
" -------------------------------------
map <F2> :NERDTreeToggle<CR> 
" -------------------------------------
set nocsverb
if filereadable("cscope.out") 
else 
	if $ANDROID_BUILD_TOP !=""
         "This assumes you have sourced the Android build environment
		cscope add $ANDROID_BUILD_TOP/cscope.out    
	else
        "Or, you can point to your android source directory in $ANDROID_DIR 
   		cscope add $ANDROID_DIR/cscope.out
     	endif 
endif
" status bar
set laststatus=2
set statusline=%4*%<\ %1*[%F]
set statusline+=%4*\ %5*[%{&encoding}, " encoding
set statusline+=%{&fileformat}]%m " file format
set statusline+=%4*%=\ %6*%y%4*\ %3*%l%4*,\ %3*%c%4*\ \<\ %2*%P%4*\ \>
highlight User1 ctermfg=red
highlight User2 term=underline cterm=underline ctermfg=green
highlight User3 term=underline cterm=underline ctermfg=yellow
highlight User4 term=underline cterm=underline ctermfg=white
highlight User5 ctermfg=cyan
highlight User6 ctermfg=white 
" man.vim
runtime! ftplugin/man.vim
nmap K <esc>:Man <cword><cr>
set cscopeprg=gtags-cscope
cs add GTAGS
set clipboard=unnamedplus
set shiftwidth=4
"set num 

" Pathogen load 
filetype off
call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on 
syntax on 

" python mode
let g:pymode = 1 
let g:pymode_python = 'python3'
let g:pymode_lint = 1
let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe']
let g:pymode_run = 1
let g:pymode_doc = 1
let g:pymode_breakpoint = 1
let g:pymode_folding = 0
" change keybinding to Ctrl + ] , define keybinding : ctrl + c g , 
" for go definition
" let g:pymode_rope_goto_definition_bind = '<C-]>' "Ctrl + ]

