"  ------------------------------PLUGINS------------------------------"
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'morhetz/gruvbox'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'jiangmiao/auto-pairs'
Plugin 'valloric/youcompleteme'
Plugin 'tibabit/vim-templates'
Plugin 'sirver/ultisnips'
Plugin 'lervag/vimtex'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" execute pathogen#infect()

"------------------------------MAPPINGS------------------------------"
inoremap jk <ESC>

nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>
"nmap <C-W> :tabclose<cr>
nmap <space> a<space><ESC>

nmap <C-M> :m+1<CR>

nmap <C-S> :w <bar> call UltiSnips#RefreshSnippets()<CR>

nmap <CR> o<ESC>

nmap <Leader>ev :tabedit $MYVIMRC<cr>
nmap <Leader>eg :tabedit $HOME/.gitconfig<cr>
nmap <Leader>eb :tabedit $HOME/.bashrc<cr>
nmap <Leader>bp :tabedit /usr/local/bin/backup<cr>
nmap <Leader>gen :tabedit $HOME/.cheatsheets/general<cr>
nmap <Leader>us :UltiSnipsEdit<cr>

nmap <C-n> :NERDTreeToggle<CR>  

"Add simple highlight removal.
nmap <Leader><space> :nohlsearch<cr>

cnoreabbrev snips UltiSnipsEdit

autocmd FileType python map <buffer> <F9> :exec '! clear; python' shellescape(@%, 1)<CR>

:map <f9> :make <cr>
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

"------------------------------AUTO-COMMANDS------------------------------"

augroup autosourcing
    autocmd!
    autocmd BufWritePost .vimrc source %
    " autocmd BufWritePost *.tex !pdflatex *.tex 
augroup  END

"------------------------------GENERAL------------------------------"

syntax on
syntax enable

"Search"
set hlsearch
set incsearch

set number
set linespace=15   	

colorscheme gruvbox
set bg=dark

"Split Management"
set splitbelow 								"Make splits default to below...
set splitright								"And to the right. This feels more natural.

set foldmethod=syntax
set foldnestmax=10
set foldlevel=2

autocmd FileType gitcommit set textwidth=72
autocmd FileType gitcommit set colorcolumn=73

"------------------------------NERDcommenter------------------------------"

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

"------------------------------Syntastic------------------------------"

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"------------------------------YouCompleteMe------------------------------"

let g:ycm_show_diagnostics_ui = 0

let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

set completeopt-=preview

"------------------------------vim-templates------------------------------"

let g:tmpl_search_paths = ['~/.vim/templates']

"------------------------------UltiSnips------------------------------"

let g:UltiSnipsExpandTrigger           = '<tab>'
let g:UltiSnipsEditSplit = 'tabdo'

"------------------------------vimtex------------------------------"

let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

"------------------------------NERDtree------------------------------"

set modifiable

