:syntax on
:set nu aw ic
:set nowrap
:set expandtab
:set tabstop=4
:set sw=4 
:colorscheme elflord

"Status line
:set statusline=%F[%M]
:set laststatus=2
" Highlight redundant whitespaces
" This will highlight the whitespace characters at end of line
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/
" This will highlight spaces before a tab:
highlight RedundantSpaces ctermbg=red guibg=red
match RedundantSpaces /\s\+$\| \+\ze\t/

