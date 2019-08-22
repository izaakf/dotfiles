" standard vim options
hi clear
set autoindent            " always set autoindenting on
set backspace=2           " allow backspacing over everything in insert mode
set cindent               " c code indenting
set diffopt=filler,iwhite " keep files synced and ignore whitespace
set foldlevel=0           " show contents of all folds
set foldcolumn=0
set foldmethod=indent     " use indent unless overridden
set guioptions-=m         " remove menu from the gui
set guioptions-=t         " remove toolbar
set hidden                " hide buffers instead of closing
set history=50            " keep 50 lines of command line history
set ignorecase            " do case insensitive matching
set incsearch             " incremental search
set laststatus=2          " always have status bar
set linebreak             " this displays long lines as wrapped at word boundries
set matchtime=10          " time to flash the brack with showmatch
set nobackup              " don't keep a backup file
set nocompatible          " use vim defaults (much better!)
set nofen                 " disable folds
set notimeout             " i like to be pokey
set ttimeout              " timeout on key-codes
set ttimeoutlen=100       " timeout on key-codes after 100ms
set ruler                 " the ruler on the bottom is useful
set scrolloff=1           " dont let the curser get too close to the edge
set showcmd               " show (partial) command in status line.
set showmatch             " show matching brackets.
set textwidth=0           " don't wrap words by default
set textwidth=80          " this wraps a line with a break when you reach 80 chars
set virtualedit=block     " let blocks be in virutal edit mode
set wildmenu              " this is used with wildmode(full) to cycle options
set autoread
set hlsearch
set noswapfile
set autowrite
set nowrap
set inccommand=nosplit
syntax enable

" tab settings
set tabstop=2
set expandtab
set shiftwidth=4
set softtabstop=2

"Longer Set options
set cscopequickfix=s-,c-,d-,i-,t-,e-,g-,f-   " useful for cscope in quickfix
set listchars=tab:>-,trail:-                 " prefix tabs with a > and trails with -
set tags+=./.tags;/,./tags;/                 " set ctags
set wildmode=list:longest,full               " list all options, match to the longest

set path+=.,..,../..,../../..,../../../..,/usr/include

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files I am not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.class,.test.js

" viminfo options
" read/write a .viminfo file, don't store more than
" 50 lines of registers
set viminfo='20,\"50

"Set variables for plugins to use

"vimspell variables
"don't automatically spell check!
let spell_auto_type=""

"taglist.vim settings
if exists("g:useNinjaTagList") && g:useNinjaTagList == 1
  set updatetime=1000 "interval to update list window

  let Tlist_Auto_Open=1 "Auto open the list window
  let Tlist_Compact_Format=1
  let Tlist_Ctags_Cmd = g:ApolloRoot . '/bin/ctags' "Ctags binary to use
  let Tlist_Enable_Fold_Column=0 "Turn off the fold column for list window
  let Tlist_Exit_OnlyWindow=1 "Exit if list is only window
  let Tlist_File_Fold_Auto_Close=1
  let Tlist_Show_Menu=1 "Show tag menu in gvim
  let Tlist_Use_Right_Window = 1 "put list window on the rigth

  "maps to close, and open list window
  map <silent> <Leader>tc :TlistClose<CR>
  map <silent> <Leader>to :TlistOpen<CR>
endif

" LargeFile.vim settings
" don't run syntax and other expensive things on files larger than NUM megs
let g:LargeFile = 100

"Turn on filetype plugins to automagically
"Grab commands for particular filetypes.
"Grabbed from $VIM/ftplugin
filetype plugin on
filetype indent on

"map \e to edit a file from the directory of the current buffer
if has("unix")
  nmap <leader>e :e <c-r>=expand("%:p:h") . "/"<cr>
else
  nmap <leader>,e :e <c-r>=expand("%:p:h") . "\\"<cr>
endif

"When editing a file, make screen display the name of the file you are editing
"Enabled by default. Either unlet variable or set to 0 in your .vimrc to disable.
let g:EnvImprovement_SetTitleEnabled = 1
function! SetTitle()
  if exists("g:EnvImprovement_SetTitleEnabled") && g:EnvImprovement_SetTitleEnabled && $TERM =~ "^screen"
    let l:title = 'vi: ' . expand('%:t')

    if (l:title != 'vi: __Tag_List__')
      let l:truncTitle = strpart(l:title, 0, 15)
      silent exe '!echo -e -n "\033k' . l:truncTitle . '\033\\"'
    endif
  endif
endfunction

" Run it every time we change buffers
autocmd BufEnter,BufFilePost * call SetTitle()

"Automatically delete trailing whitespace on write for specified filetypes
" grab the file list from the variable g:EnvImprovement_DeleteWsFiletypes
" the variable should be of type list
function! DeleteTrailingWhitespace()
  let l:EnvImprovement_SaveCursor = getpos('.')
  %s/\s\+$//e
  call setpos('.', l:EnvImprovement_SaveCursor)
endfunction

if exists("g:EnvImprovement_DeleteWsFiletypes") && !empty(g:EnvImprovement_DeleteWsFiletypes)
  let filetypeString = join(g:EnvImprovement_DeleteWsFiletypes, ',')
  execute 'autocmd FileType ' . filetypeString  . ' autocmd BufWritePre <buffer> :call DeleteTrailingWhitespace()'
endif


"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/zfreeman/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/zfreeman/.cache/dein')
  call dein#begin('/Users/zfreeman/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/zfreeman/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  "call dein#add('scrooloose/nerdtree')
  call dein#add('pangloss/vim-javascript')
  call dein#add('mxw/vim-jsx')
  call dein#add('junegunn/fzf.vim')
  call dein#add('ap/vim-css-color')
  "call dein#add('majutsushi/tagbar')
  call dein#add('tpope/vim-vinegar')
  call dein#add('scrooloose/nerdcommenter')
  call dein#add('vim-scripts/TeTrIs.vim')
  call dein#add('w0rp/ale')
  call dein#add('moll/vim-node')
  call dein#add('tpope/vim-fugitive')
  call dein#add('tpope/vim-surround')
  call dein#add('itchyny/lightline.vim')
  call dein#add('alvan/vim-closetag')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------




" plugin settings
"""""""""""""""""""""
" nerdtree
"autocmd BufEnter *lcd %:p:h
"map <C-e> :NERDTreeToggle .<CR>
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

"Ale
nnoremap <S-a>  :ALEToggle<CR>

" lightline
let g:lightline = {
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \ }
      \ }

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

" FzF
set rtp+=/usr/local/opt/fzf
"set rtp+=~/.fzf
map <C-a> :Files .<CR>
"""""""""""""""""""""

" colorscheme, term colours, hidden chars and font
colorscheme darkblue
augroup filetype javascript syntax=javascript
  hi Normal ctermbg=None ctermfg=White
  hi Constant ctermfg=None
  hi StatusLine ctermbg=none cterm=bold ctermfg=LightGrey
  hi Search ctermbg=White ctermfg=Black
  hi Visual ctermbg=Black ctermfg=White
  hi Comment ctermfg=60
  hi Special ctermfg=LightBlue
  hi IncSearch ctermbg=Black ctermfg=White
  hi CursorLineNr ctermfg=LightGrey
  hi LineNr ctermfg=DarkGrey
  hi Operator ctermfg=Yellow
  hi Error ctermbg=Red
  hi Boolean ctermfg=Red
  hi Type ctermfg=170
  hi NonText ctermfg=White
  hi ErrorMsg ctermbg=Red ctermfg=White
  hi PmenuThumb ctermbg=15 ctermfg=Black
  hi ModeMsg ctermfg=White
  highlight ExtraWhitespace ctermbg=red
  match ExtraWhitespace /\s\+$/
  set guifont=Consolas:h10
  set listchars=tab:>\ ,eol:¬,trail:.
  set statusline=%<\ %f\ %m%r%y%w%=%l\/%-6L\ %3c

  " language specific
  hi jsImport ctermfg=LightGrey
  hi jsFrom ctermfg=LightGrey
  hi jsModuleAs ctermfg=LightGrey
  hi jsExport ctermfg=LightBlue
  hi jsThis ctermbg=None ctermfg=White
  hi jsReturn ctermfg=Yellow
  hi jsNull ctermfg=Red

  " line numbering
  set number relativenumber
  autocmd InsertEnter * set nornu
  autocmd InsertLeave * set rnu
  autocmd WinEnter * set rnu
  autocmd WinLeave * set nornu

  " text bubbling
  nmap <S-k> ddkP
  nmap <S-j> ddp
  vmap <S-k> xkP`[V`]
  vmap <S-j> xp`[V`]

  " key bindings
  " tagbar
  "nnoremap <C-S>    :TagbarToggle<CR>
  " tabs
  nnoremap <S-tab>  :tabprevious<CR>
  nnoremap <tab>    :tabnext<CR>
  nnoremap <C-t>    :tabnew<CR>
  " stop highlighting for :hlsearch
  nnoremap <C-x>    :noh<CR>
  :set mouse=a
