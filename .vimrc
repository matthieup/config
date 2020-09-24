set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
" distinguish windows and linux
let uname = substitute(system('uname'), '\n', '', '')
" Install vundle with
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" Run :PluginInstall to install all
if uname == "Linux"
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
else
    set rtp+=$HOME/.vim/bundle/Vundle.vim
    call vundle#begin('$HOME/.vim/bundle/')
endif

Plugin 'VundleVim/Vundle.vim'

" Git Plugin
":Gstatus        # run `git status`
":Gdiff          # diff the working tree vs staged version
":Gcommit %      # commit the current file
Plugin 'tpope/vim-fugitive'
Plugin 'frazrepo/vim-rainbow'
" leader cc to comment, cn for nesting, cu to uncomment
Plugin 'scrooloose/nerdcommenter'
Plugin 'airblade/vim-gitgutter'
Plugin 'itchyny/lightline.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'altercation/vim-colors-solarized'
" Run :GoInstallBinaries
Plugin 'fatih/vim-go'
call vundle#end()            " required
filetype plugin indent on    " required

" lightline
set laststatus=2
" expandtabs
set et tabstop=4 shiftwidth=4
" show tabs as chars,etc...
set list
set number
set enc=utf-8 fileencoding=utf-8
set lazyredraw
"set visualbell
set listchars=tab:\|\ ,trail:-,extends:>,precedes:<,nbsp:+
let mapleader = ","
" edit .vimrc easy baby
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
"
autocmd BufNewFile *.txt echo 'Hello world'
" Go setup
let g:go_fmt_command = "goimports"    " Run goimports along gofmt on each save     
let g:go_auto_type_info = 1           " Automatically get signature/type info for object under cursor
au filetype go inoremap <buffer> . .<C-x><C-o>

" solarized - toggle bg with <leader>g
syntax enable
let g:solarized_contrast = "high"
set background=dark
colorscheme solarized
let g:solarized_termcolors=256
call togglebg#map("<leader>g")

"omnifunc completion
set completeopt=longest,menuone
set completeopt+=preview
" close scratch on completion
autocmd CompleteDone * pclose
