"
" Useful commands cheatsheet;
"
" Operators
"   c Change
"   d Delete
"   diw delete inner word
"   daw delete around word
"   y Yank into register
"   g~ Swap case
"   gu Make lowercase
"   gU Make uppercase
"   > Shift right
"   < Shift left
"   = Autoindent
"   ! Filter {motion} lines through an external program
"
" Write with sudo priviliges
"   :w !sudo tee % " 
"
" Insert mode, command line mode & bash shortcuts
"   <C+h> Delete back one character
"   <C+w> Delete back one word
"   <C+u> Delete back to start of the line
"   <C+r>{register} paste from a register while in insert mode.
"   <C+r><C+p>{register} paste from a register as is (no auto indentation etc)
"   <C+r>= epression register
"   <C+o> insert normal mode
"
" Simple arithmetic
"   <C+a> Add
"   <C+x> Subtract  
"
" Commenting (Also see gvim menu item)
"   Comment out [count]<leader>cc 
"   Toggle comment [count]<leader>c<space>
"
" Erlang
"   Omincompletion (insert mode) <C+x><C+o>
"   motions ]], [[, ]m,[m, ]M, [M, ][, []
"   text objects im, am, iM, aM eg vaM
       
" Elixir
"   Omincompletion (insert mode) <C+x><C+o>
"   docs (normal mode) <K> while on fun or module
"   docs (command mode) :ExDoc Mod/fun or Mod.fun
"   Jump to definition (command mode) :ExDef Mod/fun 
"   Jump to definition (normal mode) <C-]>
"   Jump through tag stack (normal mode) <C-T>
"   Mix :Mix command

" Vundle 
set nocompatible                            " Use vim not vi
filetype off 

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'               " Manage vim bundles
Plugin 'altercation/vim-colors-solarized'   " Solarized theme
"Plugin 'blueshirts/darcula'                 " IntelliJ darcula theme. NOTE(ar) symlink from ~/vim/colors/darcula.vim to ~/vim/bundle/darcula/colors/darkula.vim
Plugin 'mbbill/undotree'                    " A visual tree of undos
Plugin 'kien/ctrlp.vim'                     " Fuzzy file matching
Plugin 'scrooloose/nerdtree'                " File system browser
Plugin 'scrooloose/syntastic'               " Syntax checking. NOTE(ar) remember to add any required external checkers
Plugin 'mileszs/ack.vim'                    " Run ack or ag (replaces grep) 
Plugin 'scrooloose/nerdcommenter'           " Block commenting.
Plugin 'terryma/vim-multiple-cursors'       " Multi select ala Sublime Plugin 'majutsushi/tagbar'                 
Plugin 'majutsushi/tagbar'                  " ctags browser
Plugin 'vim-airline/vim-airline'            " better status bar
Plugin 'vim-airline/vim-airline-themes'     " better status bar themes
Plugin 'ervandew/supertab'                  " Tab completion
Plugin 'tpope/vim-fugitive'                 " Git integration


" Language plugins

" Erlang 
" Better Erlang plugins? https://vim-erlang.github.io/  FIXME vim motions and text objects see wiki
Plugin 'vim-erlang/vim-erlang-omnicomplete.git'     " Omnicompletion 
"Plugin 'vim-erlang/vim-erlang-compiler.git'        " Erlang syntax checking and copiler - TODO will conflict with Syntastic? why not just use :make ?
"Plugin 'vim-erlang/vim-erlang-tags.git'            " Generate module:function tags vsing :ErlangTags and set tags^=./tags
Plugin 'vim-erlang/erlang-motions.vim.git'          " Erlang motions & text objects 

" Elixir
Plugin 'elixir-lang/vim-elixir'             " Elixir support, syntax highlighting, filetype detection and auto indentation etc
Plugin 'slashmili/alchemist.vim'            " Elixir omnicompletion, documentation, definitions, mix & iex integration etc

call vundle#end()
filetype plugin indent on                   " Enable plug-ins, file type detection and indentation 

" L&F 
if has('gui_running')                      
    set lines=999 columns=999               " Open full screen
endif
let g:solarized_bold=0                      " Turn off bold fixme's, todo's etc. default value is 1
syntax enable                               " Switch syntax highlighting on, when the terminal has colors
set background=dark                         " Which solarized theme light or dark
colorscheme solarized                       " Set a theme NOTE(ar) also enable terminal solarized theme 
"colorscheme darcula                        " Set a theme NOTE(ar) turn off terminal solarized theme too?
if has('gui_running')                       " NOTE(ar) remember to set this in the terminal for the console too so that airline symbols work
    "set guifont=Monospace\ 12              " Set the font & size
    set guifont=Source\ Code\ Pro\ Medium\ 12 " Set the font & size
endif

" Behaviour
set backspace=indent,eol,start              " allow backspacing over everything in insert mode
set history=200         		            " keep 200 lines of command line history
set ruler		                            " show the cursor position all the time
set cursorline                              " highlight the current line
set showcmd		                            " display incomplete commands (bottom right of the screen)
set incsearch		                        " do incremental searching
set wildmenu                                " autocomplete for the command menu
set lazyredraw                              " redraw only when necessary
set showmatch                               " highlight matching parenthesis
set mouse=a                                 " Enable the mouse in all modes
set wrap                                    " Auto wrap long lines accoring to the window width
set tw=180                                  " Wrap long lines as N chars
set showbreak=↪                             " Append arrow to wrapped lines 
"set spelllang=en_gb spell                  " Enable spelling and a proper dictionary TODO(ar) need to configure this to only spell check comments
set tabstop=4                               " number of visual spaces per TAB
set softtabstop=4                           " number of spaces in tab when editing
set shiftwidth=4                            " make an indent correspond to a single tab, ie for indenting blocks of text/code >>, <<, 5>> , >i{, <i{ etc
set expandtab                               " turns tabs into spaces
set nrformats-=octal                        " Treat numerals such as 007 as decimal and not octal when adding 10<ctrl>a or subtracting 10<ctrl>x. Default in vim8.
runtime macros/machit.vim                   " Enhance the % bracket jump command

" Using the arrow keys while in insert mode creates a new undo chunk as if we had switched back to normal mode to use h,j,k, or l.
" This also has implications on the operation of the dot command so we disable these keys.
noremap <Up> :echo "No no no arrow keys!"<CR>
noremap <Down> :echo "No no no arrow keys!"<CR>
noremap <Left> :echo "No no no arrow keys!"<CR>
noremap <Right> :echo "No no no arrow keys!"<CR>

" Backup to a ~/.vim-tmp dir to prevent losing unsaved data
set backup
set backupdir=~/.vim-tmp,/tmp               " List of dirs for the backup file. NB the dirs must exist
set directory=~/.vim-tmp,/tmp               " List of dirs for the swap file. NB the dirs must exist
set writebackup

" Project specific .vimrc
set exrc                                    " Source any .vimrc file in the current directory
set secure                                  " limit what can be done in project specific .vimrc files

" Searching
set incsearch                               " search as you type
set hlsearch                                " highlight matches
nnoremap <leader><space> :nohlsearch<CR>    " turn off search highlight

" Movement
"nnoremap j gj                               " do not jump over wrapped lines
"nnoremap k gk                               " do not jump over wrapped lines

" Always jump to the last known cursor position
autocmd BufReadPost *           
\ if line("'\"") > 1 && line("'\"") <= line("$") |
\   exe "normal! g`\"" |
\ endif

" Mappings
"let mapleader=","                                                  " set my preferred leader key for custom bindings
" Remap <Esc> as its too far away. <ctrl>[ exits INSERT mode too. NB this comment must not be on the same line as map tries to interpret the the blank spaces after <Esc>
inoremap jk <Esc> 
nnoremap <leader>u :UndotreeToggle<CR>                              " toggle undo tree
nnoremap <leader>sv :source $MYVIMRC<CR>                            " source my vimrc
"nnoremap <leader>s :mksession<CR>                                  " Save all files as a session. Use vim -S to reopen the session

" Language specifics
augroup project
   autocmd!
   autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen        " Vim incorrectly identifies headers as C++ and not C 
augroup END

" Plugins

" CtrlP
let g:ctrlp_match_window = 'bottom,order:ttb'                       " tbb orders matching files top to bottom
let g:ctrlp_switch_buffer = 0                                       " always open new files in a new buffer
let g:ctrlp_working_path_mode = 0                                   " make CtrlP aware if we change dirs  
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'      " tell CtrlP to use ag for speed

" NERDTree
" ctrl+ww switch windows or ctrl+w h (move left) or ctrl+w l (move right)
nmap <F7> :NERDTreeToggle<CR>                                       " ctrl+n toggles nerd tree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif   " automatically close nerd tree if its the only remaining buffer

"NERDCommenter
let g:NERDDefaultAlign = 'left'                                     " Left align

" Syntastic
" TODO(ar) recommended settings return to these. See :h syntastic & :h syntastic-checkers
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_sort_aggregated_errors = 1

" Ack
" Use ag instead of ack if its present
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" The Silver Searcher (ag) 
set grepprg=ag\ --vimgrep\ $*                                       " use ag insted of grep 
set grepformat=%f:%l:%c:%m

" vim-multiple-cursors
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-S-n>'                               " Conflicts with CtrlP mappings so map to Ctrl+Shift+n
let g:multi_cursor_prev_key='<C-S-p>'                               " Conflicts with CtrlP mappings so map to Ctrl+Shift+x
let g:multi_cursor_skip_key='<C-S-x>'                               " Conflicts with CtrlP mappings so map to Ctrl+Shift+x
let g:multi_cursor_quit_key='<Esc>'

" tagbar
nmap <F8> :TagbarToggle<CR>                                         " Toggle tagbar

" vim-airlines
let g:airline#extensions#tabline#enabled = 1                        " Show buffers in the status bar if there is only one tab open
set laststatus=2                                                    " Always show our status line
let g:airline_theme='solarized'                                     " Set a theme to use
let g:airline_powerline_fonts = 1                                   " Use powerline symbols
let g:airline#extensions#whitespace#enabled = 0                     " Toggle detection of whitespace

" SuperTab
let g:SuperTabMappingForward = '<c-tab>'                            " Remap supertab to <CTRL-SPACE>
let g:SuperTabMappingBackward = '<s-c-tab>'                         " Remap supertab to <SHIFT-CTRL-SPACE>

" Elixir Alchemist
"let g:alchemist#elixir_erlang_src = "/usr/local/share/src"
