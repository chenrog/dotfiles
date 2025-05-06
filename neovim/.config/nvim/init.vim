" BASIC SETTINGS {
    set relativenumber " relative other lines
    set number " absolute this line

    set breakindent " soft wrap will indent
    set linebreak " break on words not mid-word

    set scrolljump=5 " If you hit bottom or top, jump 5
    set scrolloff=5 " Keep focus on middle of screen when possible

    set clipboard+=unnamedplus " default register is clipboard
" }



" KEY MAPPINGS {
    let g:mapleader="\<space>"

    " Scrolling/Line movement
    nnoremap gj j
    nnoremap gk k
    nnoremap j gj
    nnoremap k gk
" }

   call plug#begin('~/.local/share/nvim/plugged')

   " Add this line to install the Catppuccin color scheme
   Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
   Plug 'neanias/everforest-nvim', { 'branch': 'main', 'as': 'everforest' }

   call plug#end()

   " Set the color scheme
   colorscheme catppuccin
