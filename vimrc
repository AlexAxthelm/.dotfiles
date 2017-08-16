" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2011 Apr 15
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
	finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible              " be iMproved, required
filetype off                  " required

" let vimplug install itself
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" Plug 'tpope/vim-markdown'
" Plug 'nathanaelkane/vim-indent-guides'
" Plug 'suan/vim-instant-markdown'
" Plug 'vim-latex/vim-latex'
Plug 'altercation/vim-colors-solarized'
" Plug 'reedes/vim-pencil'
" Plug 'mikewest/vimroom'
" Plug 'parkr/vim-jekyll'
" Plug 'ervandew/screen'
Plug 'jalvesaq/Nvim-R'
" Plug 'junegunn/vim-emoji'
" Plug 'valloric/youcompleteme'
" Plug 'scrooloose/nerdcommenter'
" Plug 'scrooloose/nerdtree'
" Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'luochen1990/rainbow'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
" Plug 'tpope/vim-speeddating'
" Plug 'easymotion/vim-easymotion'
" Plug 'scrooloose/syntastic'
Plug 'benmills/vimux'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-unimpaired'
" Plug 'gilsondev/searchtasks.vim'
" Plug 'https://github.com/jaxbot/github-issues.vim'
" Plug 'jaxbot/semantic-highlight.vim'
Plug 'djoshea/vim-autoread'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'edkolev/promptline.vim'
Plug 'zef/vim-cycle'
Plug 'ajh17/VimCompletesMe'
Plug 'vim-scripts/AutoComplPop'
Plug 'w0rp/ale'
Plug 'jiang-hang/vim4roxygen2'

call plug#end()


" Airline Stuff
set laststatus=2
let g:airline_powerline_fonts = 1
" let g:airline_left_sep=''
" let g:airline_right_sep=''
let g:airline_skip_empty_sections = 1

" tmuxline stuff
" let g:tmuxline_preset = 'powerline'

" promptline
" let g:promptline_preset = 'full'

" This section found from
" http://joshuaoldenburg.com/articles/my-terminal-workflow/
"
"Tmuxline - :TmuxlineSnapshot! ~/.dotfiles/.tmuxline.tmux.conf
"Far bottom right shows DHCP WiFi IP, with an H appended at home
let g:tmuxline_preset = {
	\'a'       : '#S:#I',
	\'b disabled'       : '',
	\'c disabled'       : '',
	\'win'     : ['#I', '#W'],
	\'cwin'    : ['#I', '#W'],
	\'x'       : '#(~/.dotfiles/bin/tmux-battery)',
	\'y'       : ['%a', '%Y-%m-%d', '%l:%M%p'],
	\'z'       : ['#(whoami)', '#(~/.dotfiles/bin/getipfortmux || hostname)'],
	\'options' : {'status-justify': 'left'}}

"Promptline - :PromptlineSnapshot! ~/.dotfiles/.promptline.sh airline
"These functions disable the host and user when in tmux, as they are shown in
"  the bottom right corner of the window
fun! Joshthegeek_promptline_host(...)
	" host is \h in bash, %m in zsh
	return '$([[ -n ${TMUX-} ]] && exit 1; [[ -n ${ZSH_VERSION-} ]] && print %m || printf "%s" \\h)'
endfun

fun! Joshthegeek_promptline_user(...)
	" user is \u in bash, %n in zsh
	return '$([[ -n ${TMUX-} ]] && exit 1; [[ -n ${ZSH_VERSION-} ]] && print %n || printf "%s" \\u)'
endfun

let g:promptline_preset = {
	\'a': [ Joshthegeek_promptline_host(), Joshthegeek_promptline_user() ],
	\'b': [ promptline#slices#cwd({ 'dir_limit': 2 }) ],
	\'z': [ promptline#slices#vcs_branch(), promptline#slices#jobs() ],
	\'warn': [ promptline#slices#battery(), promptline#slices#last_exit_code() ]}
let g:promptline_theme = 'airline'
let g:promptline_symbols = {'truncation' : '…'}


" http://stackoverflow.com/a/23704021/7571303
" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2011 Apr 15
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
	finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible              " be iMproved, required
filetype off                  " required

" let vimplug install itself
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-markdown'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'suan/vim-instant-markdown'
" Plug 'vim-latex/vim-latex'
Plug 'altercation/vim-colors-solarized'
" Plug 'reedes/vim-pencil'
" Plug 'mikewest/vimroom'
" Plug 'parkr/vim-jekyll'
" Plug 'ervandew/screen'
Plug 'jalvesaq/Nvim-R'
" Plug 'junegunn/vim-emoji'
" Plug 'valloric/youcompleteme'
" Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'luochen1990/rainbow'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
" swap files (.swp) in a common location
" // means use the file's full path
set directory=~/.vim/_swap//

" backup files (~) in a common location if possible
set backup
set backupdir=~/.vim/_backup/,~/tmp,.

" turn on undo files, put them in a common location
set undofile
set undodir=~/.vim/_undo/
"
" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
	set nobackup		" do not keep a backup file, use versions instead
else
	set backup		" keep a backup file
endif
set history=500		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set number		" show line numbers
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set nolbr		" set line breaks at end of word.
set linebreak		" break at whole words --Alex

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

 "Create new line without entering insert mode
map <Leader>o o<ESC>
map <Leader>O O<ESC>

" Let PDF be defaul latex Compile
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats='pdf, aux'

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>
" map a double semi-colon to the escape function
inoremap ;; <Esc>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
	set mouse=a
endif

" relative numbering
set relativenumber

" Set column 80 to be a different color
set colorcolumn=80

" Set default register to the clipboard
set clipboard^=unnamed

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
syntax on
set hlsearch
" enable Solarized Colors
set t_Co=256                        " force vim to use 256 colors
set background=light
" let g:solarized_termcolors=256
		" solarized options
let g:solarized_visibility = "low"
let g:solarized_contrast = "high"
colorscheme solarized

	set listchars=eol:¬,tab:←→,trail:~,extends:>,precedes:<,space:·
set list

" Hopefully fix the lv command for latexvim
" hel from
" http://stackoverflow.com/questions/12650528/viewing-pdfs-with-vim-latex-suite-start-preview-shell-returned-127
let g:tex_flavor='latex'
let g:Tex_TreatMacViewerAsUNIX = 1
let g:Tex_ExecuteUNIXViewerInForeground = 1
let g:Tex_ViewRule_ps = 'open -a Preview'
let g:Tex_ViewRule_pdf = 'open -a Preview'
let g:Tex_ViewRule_dvi = 'open -a Preview'

" Only do this part when compiled with support for autocommands.
if has("autocmd")

	" Enable file type detection.
	" Use the default filetype settings, so that mail gets 'tw' set to 72,
	" 'cindent' is on in C files, etc.
	" Also load indent files, to automatically do language-dependent indenting.
	filetype plugin indent on

	" Put these in an autocmd group, so that we can delete them easily.
	augroup vimrcEx
		au!

		" For all text files set 'textwidth' to 78 characters.
		autocmd FileType text setlocal textwidth=78

		" When editing a file, always jump to the last known cursor position.
		" Don't do it when the position is invalid or when inside an event handler
		" (happens when dropping a file on gvim).
		" Also don't do it when the mark is in the first line, that is the default
		" position when opening a file.
		autocmd BufReadPost *
					\ if line("'\"") > 1 && line("'\"") <= line("$") |
					\   exe "normal! g`\"" |
					\ endif

	augroup END

else

	set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
	command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
				\ | wincmd p | diffthis
endif

" Vim-LaTeX settings:
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults
to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

"this is mostly a matter of taste. but LaTeX looks good with just a bit
" of indentation.
set sw=2
" TIP: if you write your \label's as \label{fig:something}, then if you
" type in \ref{fig: and press <C-n> you will automatically cycle through
" all the figure labels. Very useful!
set iskeyword+=:

" Turn on Spell Check auto
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufRead,BufNewFile *.tex setlocal spell
autocmd BufRead,BufNewFile gitcommit setlocal spell

" Disable vimr replacing underscores with assignment <-
let R_assign = 3

" set vim-r-plugin to
let r_indent_align_args = 0

" Set vim-r-plugin to mimics ess :
let r_indent_ess_comments = 0
let r_indent_ess_compatible = 0

" Let the tabs be reasonable
set tabstop=2

" setup rainbow
" let g:rainbow_active = 1
nnoremap <leader>R :RainbowToggle

set completefunc=emoji#complete

" " Syntastic Defaults
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" "Enable lintr in R
" let g:syntastic_enable_r_lintr_checker = 1
" let g:syntastic_r_checkers = ['lintr']
" let g:syntastic_rmd_checkers = ['lintr', 'text/proselint']

" ALE settings
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_column_always = 1
let g:ale_open_list = 1
let g:ale_set_loclist = 1
let g:ale_r_lintr_options = 'lintr::with_defaults(object_usage_linter = NULL)'

" " map a leader shorcut to jump to the next linter flag
map [l <Plug>(ale_previous_wrap)
map ]l <Plug>(ale_next_wrap)

" allow vimux to be my maker
map <Leader><Leader>m :w<CR> :call VimuxRunCommand("time make")<CR>
map <F5> :w<CR> :call VimuxRunCommand("time make")<CR>
map <F6> :call VimuxCloseRunner()<CR>
let VimuxResetSequence = ""
let g:VimuxUseNearest = 0

" Set 2 space as default tab in R files
autocmd FileType r setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType rmd setlocal expandtab shiftwidth=2 softtabstop=2

"put a space in NERDCommenter
let NERDSpaceDelims=1

" Nvim-R settings.
let R_in_buffer = 0
let R_applescript = 0
let R_tmux_split = 1
let R_args = ['--no-save --no-restore --quiet']
let R_nvim_wd = 1

" let's map leader to be the space bar. That sounds useful
let mapleader ="\<space>"
let maplocalleader ="\<space>"
