" basic settings
hi clear
set makeprg=node\ %
set nocompatible
set autoread
set hlsearch
set noswapfile
set autowrite
set nowrap
set wildmode=longest,list,full
set wildmenu
set foldcolumn=0
syntax enable


" plugin settings
"""""""""""""""""""""
" nerdtree
map <C-e> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"""""""""""""""""""""
" CtrlP
map <C-a> :CtrlP .<CR>
"""""""""""""""""""""
" vundle setup
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'scrooloose/nerdtree'
Plugin 'pangloss/vim-javascript'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'ternjs/tern_for_vim'
Plugin 'ap/vim-css-color'
Plugin 'isRuslan/vim-es6'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-ruby/vim-ruby'
Plugin 'VundleVim/Vundle.vim'
call vundle#end()
filetype plugin indent on

" tab settings
set tabstop=2
set expandtab
set shiftwidth=2
set softtabstop=2


" colorscheme, term colours, hidden chars and font
augroup filetype javascript syntax=javascript
hi Normal guibg=NONE ctermbg=None ctermfg=None
hi Constant ctermfg=None
hi StatusLine ctermbg=none cterm=bold
hi Comment ctermfg=Blue
hi Special ctermfg=Red
hi LineNr ctermfg=Yellow
hi Operator ctermfg=Yellow
hi Error ctermbg=Red
hi Boolean ctermfg=Red gui=italic
highlight ExtraWhitespace ctermbg=red
match ExtraWhitespace /\s\+$/
set guifont=Consolas:h10
set listchars=tab:>\ ,eol:¬,trail:.
set statusline=%<\ %f\ %m%r%y%w%=%l\/%-6L\ %3c


" line numbering
set number relativenumber
set nu
autocmd InsertEnter * set nornu
autocmd InsertLeave * set rnu
autocmd WinEnter * set rnu
autocmd WinLeave * set nornu

" text bubbling
nmap <S-k> ddkP
nmap <S-j> ddp
vmap <S-k> xkP`[V`]
vmap <S-j> xp`[V`]

