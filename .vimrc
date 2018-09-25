""""""""""""""""""""""""""""""""""""""""
" => General
""""""""""""""""""""""""""""""""""""""""

set nocompatible

" Lines of history VIM has to remember (max=?)
set history=500

" Enable filetype plugins
filetype on
filetype plugin indent on

" Set to auto read when a file is changed from the outside
set autoread

" A buffer becomes hidden when it is abandoned
set hidden


""""""""""""""""""""""""""""""""""""""""
" => Plugins
""""""""""""""""""""""""""""""""""""""""

" Init vim plug
if empty(glob ('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Init plugins
call plug#begin('~/.vim/plugged')

" Vim themes
Plug 'morhetz/gruvbox'
Plug 'dracula/vim'
Plug 'rakr/vim-one'

" General vim ui
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'edkolev/tmuxline.vim'
Plug 'junnegunn/fzf', { 'dir' : '~/.fzf', 'do': './install --all' }
Plug 'yuttie/comfortable-motion.vim'

" General coding
Plug 'vim-syntastic/syntastic'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'jiangmiao/auto-pairs' " for autocomplete of brackets
Plug 'junegunn/vim-easy-align'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-surround'

" Git
Plug 'airblade/vim-gitgutter'

" Purescript
Plug 'purescript-contrib/purescript-vim'
Plug 'frigoeu/psc-ide-vim'

" Javascript
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'

" Html
Plug 'mattn/emmet-vim'
Plug 'othree/html5.vim'

" Note taking
Plug 'vimwiki/vimwiki'
Plug 'mtth/scratch.vim'

call plug#end()


""""""""""""""""""""""""""""""""""""""""
" => Plugin Config
""""""""""""""""""""""""""""""""""""""""

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0

" Powerline fonts for airline
let g:airline_powerline_fonts=1

" Psc ide with sytastic
let g:psc_ide_sytastic_mode=1

" Nerdtree
let NERDTreeShowHidden=1 " See hidden files

""""""""""""""""""""""""""""""""""""""""
" => User Interface
""""""""""""""""""""""""""""""""""""""""

" Set lines to cursor from end
set scrolloff=10

" Line numbers
set number
set relativenumber

set mouse=a

" Show relative postion of cursor to file
set ruler

" more natural split direction
set splitbelow
set splitright

""""""""""""""""""""""""""""""""""""""""
" => Editor
""""""""""""""""""""""""""""""""""""""""

" Ignore case when searching
set ignorecase

" Matching brackets
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

set encoding=utf8

" Turn off backup off, since most stuff is in version control
set nobackup
set nowb
set noswapfile

" Fors tabs and spaces settings
set expandtab " Use spaces instead of tabs
set tabstop=2 " 1 tab == 2 spaces
set shiftwidth=2 " Indents width 2
set softtabstop=2 " Number of columns for a tab

" Wrap lines
set lbr
set tw=500
set wrap

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Modern browser like search
set incsearch

""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
""""""""""""""""""""""""""""""""""""""""

" Airline Theme
let g:airline_theme='one'

" Enable syntax higlighting
syntax on

" Theme
try
  colorscheme gruvbox
catch
endtry

set background=dark


""""""""""""""""""""""""""""""""""""""""
" => Key Bindings
""""""""""""""""""""""""""""""""""""""""

"Map leader key
let mapleader=","

" :W sudo saves the file
command W w !sudo tee % > /dev/null

" Map <Space> to : (Command mode)
map <space> :

" Disable highlight
map <silent> <leader><cr> :noh<cr>

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Switching between buffers
map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" For managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabnew<cr>
map <leader>t<leader> :tabnext<cr>

" Pressing tab toggles, shift tab toggles back
nnoremap <Tab> gt
nnoremap <S-Tab> gT

" Toogle between current and last accessed tab
let g:lasttab=1
nmap <Leader>tl :exe "tabn".g:lasttab<CR>
nmap <M-Tab> :exe "tabn".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Open new tab with current buffer's path
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Ctrl + c to quit, for closing buffers/windows
nnoremap <C-C> :q<cr>

" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" Ctrl + p for fzf
nnoremap <C-p> :FZF<CR>

" For easy align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
