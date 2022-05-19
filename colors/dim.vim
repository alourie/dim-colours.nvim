" dim.vim -- Neovim color scheme
" Author: jgvw
" Description: Apple's Xcode 13's default color scheme for Neovim. Heavily
" modified lua port of Aramis Razzaghipour's Xcode 11's color scheme for Vim
" (https://github.com/arzg/vim-colors-dim).

highlight clear

if exists("syntax_on")
    syntax reset
endif

let g:colors_name = "dim"

lua require("dim-colors").colorscheme()
