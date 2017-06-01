" Vundle 
set nocompatible                            " Use vim not vi
filetype off 

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'               " Manage vim bundles
Plugin 'altercation/vim-colors-solarized'   " Solarized theme
Plugin 'blueshirts/darcula'                 " IntelliJ darcula theme. NOTE(ar) symlink from ~/vim/colors/darcula.vim to ~/vim/bundle/darcula/colors/darkula.vim
Plugin 'mbbill/undotree'                    " A visual tree of undos
Plugin 'kien/ctrlp.vim'                     " Fuzzy file matching
Plugin 'scrooloose/nerdtree'                " File system browser
Plugin 'scrooloose/syntastic'               " Syntax checking. NOTE(ar) remember to add any required external checkers
Plugin 'mileszs/ack.vim'                    " Run ack or ag (replaces grep) 
Plugin 'scrooloose/nerdcommenter'           " Block commenting. comment: <leader>cc toggle: <leader>\c<space>. Also see gvim menu item 
Plugin 'terryma/vim-multiple-cursors'       " Multi select ala Sublime Plugin 'majutsushi/tagbar'                 
Plugin 'majutsushi/tagbar'                  " ctags browser
Plugin 'vim-airline/vim-airline'            " better status bar
Plugin 'vim-airline/vim-airline-themes'     " better status bar themes
Plugin 'ervandew/supertab'                  " Tab completion
Plugin 'tpope/vim-fugitive'                 " Git integration
Plugin 'easymotion/vim-easymotion'          " Better vim motions eg <leader><leader>w <leader><leader>f{char}


" Language plugin

" Erlang 
" Better Erlang plugins? https://vim-erlang.github.io/  FIXME vim motions and text objects see wiki
Plugin 'vim-erlang/vim-erlang-omnicomplete.git'     " Omnicompletion via |i_CTRL-X_CTRL-O|
"Plugin 'vim-erlang/vim-erlang-compiler.git'        " Erlang syntax checking and copiler - TODO will conflict with Syntastic? why not just use :make ?
"Plugin 'vim-erlang/vim-erlang-tags.git'            " Generate module:function tags vsing :ErlangTags and set tags^=./tags
Plugin 'vim-erlang/erlang-motions.vim.git'          " Erlang motions ]], [[, ]m,[m, ]M, [M, ][, [] and text objects im, am, iM, aM eg vaM

" Elixir
Plugin 'elixir-lang/vim-elixir'             " Elixir support, syntax highlighting, filetype detection and auto indentation etc

call vundle#end()
filetype plugin indent on                    " Enable plug-ins, file type detection and indentation 

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
"nnoremap <Up> <Nop>                         " Temporarily disable the arrow keys
"vnoremap <Up> <Nop>                         " Temporarily disable the arrow keys
"inoremap <Up> <Nop>                         " Temporarily disable the arrow keys
"nnoremap <Down> <Nop>                       " Temporarily disable the arrow keys
"vnoremap <Down> <Nop>                       " Temporarily disable the arrow keys
"inoremap <Down> <Nop>                       " Temporarily disable the arrow keys
"nnoremap <Left> <Nop>                       " Temporarily disable the arrow keys
"vnoremap <Left> <Nop>                       " Temporarily disable the arrow keys
"inoremap <Left> <Nop>                       " Temporarily disable the arrow keys
"nnoremap <Right> <Nop>                      " Temporarily disable the arrow keys
"vnoremap <Right> <Nop>                      " Temporarily disable the arrow keys
"inoremap <Right> <Nop>                      " Temporarily disable the arrow keys
runtime macros/machit.vim                   " Enhance the % bracket jump command

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
"nnoremap B ^                                " beginning of line TODO remaps word boundary which is useful
"nnoremap E $                                " end of line TODO remaps word boundary which is useful

" Always jump to the last known cursor position
autocmd BufReadPost *           
\ if line("'\"") > 1 && line("'\"") <= line("$") |
\   exe "normal! g`\"" |
\ endif

" Mappings
"let mapleader=","                                                   " set my preferred leader key for custom bindings
"inoremap jk <esc>                                                  " when in insert mode <esc> is too far away - FIXME cursor moves to a random position"
nnoremap <leader>u :UndotreeToggle<CR>                              " toggle undo tree
nnoremap <leader>sv :source $MYVIMRC<CR>                            " source my vimrc
"nnoremap <leader>s :mksession<CR>                                   " Save all files as a session. Use vim -S to reopen the session

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

" Easy motion defaults
" TODO(ar) These are the minimal defaults see :h easymotion.txt
"let g:EasyMotion_do_mapping = 0                                     " Disable default mappings
"nmap s <Plug>(easymotion-overwin-f)                                 " Jump to anywhere you want with minimal keystrokes, with just one key binding. `s{char}{label}`
"nmap s <Plug>(easymotion-overwin-f2)                                " or `s{char}{char}{label}` Need one more keystroke, but on average, it may be more comfortable.
"let g:EasyMotion_smartcase = 1                                      " Turn on case insensitive feature
"map <Leader>j <Plug>(easymotion-j)                                  " JK motions: Line motions
"map <Leader>k <Plug>(easymotion-k)                                  " JK motions: Line motions

" vim-airline
let g:airline#extensions#tabline#enabled = 1                        " Show buffers in the status bar if there is only one tab open
set laststatus=2                                                    " Always show our status line
let g:airline_theme='solarized'                                     " Set a theme to use
let g:airline_powerline_fonts = 1                                   " Use powerline symbols
let g:airline#extensions#whitespace#enabled = 0                     " Toggle detection of whitespace

" SuperTab
let g:SuperTabMappingForward = '<c-space>'                          " Remap supertab to <CTRL-SPACE>
let g:SuperTabMappingBackward = '<s-c-space>'                       " Remap supertab to <SHIFT-CTRL-SPACE>
