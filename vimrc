set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-ctrlspace/vim-ctrlspace'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'majutsushi/tagbar'
Plugin 'Shougo/deoplete.nvim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'SirVer/ultisnips'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'honza/vim-snippets'
Plugin 'eugen0329/vim-esearch'
Plugin 'rakr/vim-one'
" All of your Plugins must be added before the following line
call vundle#end()    

set termguicolors
syntax on

set background=light
let g:one_allow_italics = 1
colorscheme one
""""""""""""""""""""""""""""""""""""""""""""""""""
" 
""""""""""""""""""""""""""""""""""""""""""""""""""
set nu
filetype plugin indent on

let mapleader = "\\"
inoremap jj <Esc>

nnoremap <Leader>s :w<CR>
nnoremap <Leader>q :q<CR>

set tabstop=4
set shiftwidth=4

set cursorline
"hi CursorLine term=bold cterm=bold guibg=Grey40
"
hi Normal ctermbg=259


""""""""""""""""""""""""""""""""""""""""
"              Plugins                 "
""""""""""""""""""""""""""""""""""""""""
" NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nnoremap <F2> :NERDTreeToggle<CR>

" Press F3 to toggle highlighting on/off, and show current value.
noremap <F3> :set hlsearch! hlsearch?<CR>
nnoremap <F4> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>

nnoremap <F5> :TagbarToggle<CR>

let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1


set wildchar=<Tab> wildmenu wildmode=full

set wildcharm=<C-Z>

let g:airline_theme='bubblegum'

set hidden
set confirm

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
			\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
			\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>


let g:monokai_term_italic = 1
let g:monokai_gui_italic = 1

set backspace=indent,eol,start

if executable("ag")
    let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
endif

nnoremap <silent><C-p> :CtrlSpace O<CR>
nnoremap <C-Space> :CtrlSpace<CR>

let g:CtrlSpaceLoadLastWorkspaceOnStart = 1
let g:CtrlSpaceSaveWorkspaceOnSwitch = 1
let g:CtrlSpaceSaveWorkspaceOnExit = 1
let g:CtrlSpaceUseMouseAndArrowsInTerm = 1

hi CtrlSpaceSelected ctermfg=White ctermbg=DarkYellow cterm=bold 
hi link CtrlSpaceNormal Normal

let g:rehash256 = 1

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

let g:esearch = {
			\ 'out': 'qflist'
			\}
let esearch#cmdline#help_prompt = 0

highlight PMenuSel ctermfg=0 ctermbg=14 guifg=#000000 guibg=#e9ff00
highlight CtrlSpaceSelected ctermfg=0 ctermbg=14 guifg=#000000 guibg=#e9ff00

augroup filetype_java
	autocmd!
	autocmd FileType java setlocal shiftwidth=2
	autocmd FileType java setlocal tabstop=2
	autocmd FileType java setlocal expandtab
augroup END

inoremap <silent><expr> <TAB>
		\ pumvisible() ? "\<C-n>" :
		\ <SID>check_back_space() ? "\<TAB>" :
		\ deoplete#mappings#manual_complete()
		function! s:check_back_space() abort "{{{
		let col = col('.') - 1
		return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}
