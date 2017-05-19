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
Plugin 'scrooloose/nerdcommenter'           " Block commenting
Plugin 'terryma/vim-multiple-cursors'       " Multi select ala Sublime
Plugin 'majutsushi/tagbar'                  " ctags browser
Plugin 'vim-airline/vim-airline'            " better status bar
Plugin 'vim-airline/vim-airline-themes'     " better status bar themes
Plugin 'yuttie/comfortable-motion.vim'      " Smooth scrolling :-)

" Language plugins

" Erlang 
" Better Erlang plugins? https://vim-erlang.github.io/ 
Plugin 'vim-erlang/vim-erlang-omnicomplete.git'     " Omnicompletion via |i_CTRL-X_CTRL-O|
"Plugin 'vim-erlang/vim-erlang-compiler.git'        " Erlang syntax checking and copiler - TODO will conflict with Syntastic? why not just use :make ?
"Plugin 'vim-erlang/vim-erlang-tags.git'            " Generate module:function tags using :ErlangTags and set tags^=./tags

" Elixir
Plugin 'elixir-lang/vim-elixir'             " Elixir support, syntax highlighting, filetype detection and auto indentation etc

call vundle#end()
filetyp plugin indent on                    " Enable plug-ins, file type detection and indentation 

" L&F 
if has('gui_running')                      
    set lines=999 columns=999               " Open full screen
endif
let g:solarized_bold=0                      " Turn off bold fixme's, todo's etc. default value is 1
syntax enable                               " Switch syntax highlighting on, when the terminal has colors
set background=dark                         " Which solarized theme light or dark
colorscheme solarized                       " Set a theme NOTE(ar) also enable terminal solarized theme 
"colorscheme darcula                        " Set a theme NOTE(ar) turn off terminal solarized theme too?
set guifont=Monospace\ 12                   " Set the font & size
"set guifont=Source\ code\ pro\ 12          " Set the font & size


" Behaviour
set backspace=indent,eol,start              " allow backspacing over everything in insert mode
set history=200         		            " keep 200 lines of command line history
set ruler		                            " show the cursor position all the time
set cursorline                              " highlight the current line
set showcmd		                            " display incomplete commands
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
set shiftwidth=4                            " make an indent correspond to a single tab
set expandtab                               " turns tabs into spaces
"noremap <Up> <Nop>                         " Temporarily disable the arrow keys
"noremap <Down> <Nop>                       " Temporarily disable the arrow keys
"noremap <Left> <Nop>                       " Temporarily disable the arrow keys
"noremap <Right> <Nop>                      " Temporarily disable the arrow keys
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
"nnoremap gV `[v`]                           " highlight the last inserted text TODO working

" Movement
"nnoremap j gj                               " do not jump over wrapped lines
"nnoremap k gk                               " do not jump over wrapped lines

" Always jump to the last known cursor position
autocmd BufReadPost *           
\ if line("'\"") > 1 && line("'\"") <= line("$") |
\   exe "normal! g`\"" |
\ endif

" Mappings
let mapleader=","                                                   " set my preferred leader key for custom bindings
"inoremap jk <esc>                                                  " FIXME when in insert mode <esc> is too far away - this is misbehaving
nnoremap <leader>u :UndotreeToggle<CR>                              " toggle undo tree
nnoremap <leader>sv :source $MYVIMRC<CR>                            " source my vimrc
nnoremap <leader>s :mksession<CR>                                   " Save all files as a session. Use vim -S to reopen the session

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
map <C-n> :NERDTreeToggle<CR>                                       " ctrl+n toggles nerd tree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif   " automatically close nerd tree if its the only remaining buffer

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

" Ag
" TODO(ar) some testing or we use universal ctags / TagBar bundle
" The Silver Searcher (ag) 
set grepprg=ag\ --vimgrep\ $*                                       " use ag insted of grep 
set grepformat=%f:%l:%c:%m

" vim-multiple-cursors
" TODO(ar) not just word boundaries?
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-S-n>'                               " Conflicts with CtrlP mappings so map to Ctrl+Shift+n
let g:multi_cursor_prev_key='<C-S-p>'                               " Conflicts with CtrlP mappings so map to Ctrl+Shift+x
let g:multi_cursor_skip_key='<C-S-x>'                               " Conflicts with CtrlP mappings so map to Ctrl+Shift+x
let g:multi_cursor_quit_key='<Esc>'

" tagbar
nmap <F8> :TagbarToggle<CR>                                         " Toggle tagbar

" vim-airline
let g:airline#extensions#tabline#enabled = 1                        " Show buffers in the status bar if there is only one tab open
set laststatus=2                                                    " Always show our status line
let g:airline_theme='solarized'                                     " Set a theme to use

" comfortable-motion
" Ctrl+d/Crtl+u or Ctrl+f/Ctrl+b or Ctrl+e/Ctrl+y scrolls the window without moving the cursor
let g:comfortable_motion_scroll_down_key = "j"
let g:comfortable_motion_scroll_up_key = "k"
