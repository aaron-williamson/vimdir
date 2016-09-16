" My plugins
" The text after -- are benchmarks regarding vim config

" Turn filetype off for vundle
filetype off

" -- 77ms without any of the lines in here enabled

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Enable vundle
Plugin 'VundleVim/Vundle.vim'

" Plugins -- 79ms without any
" Benchmarks here include the respective configuration for each plugin
Plugin 'terryma/vim-multiple-cursors'     " Sublime-text style multiple cursors -- 80ms (+1ms)
Plugin 'chriskempson/base16-vim'          " Base 16 color schemes               -- 103ms (+23ms) this and solarized are mutually exclusive
Plugin 'altercation/vim-colors-solarized' " Solarized color scheme              -- 98ms (+18ms)
Plugin 'ctrlpvim/ctrlp.vim'               " CtrlP for fuzzy find/open           -- 100ms (+2ms)
Plugin 'tpope/vim-fugitive'               " Fugitive for git integration        -- 105ms (+5ms)
Plugin 'rust-lang/rust.vim'               " Syntax highlighting for rust        -- 105ms (+0ms)
Plugin 'tpope/vim-rails'                  " Extra functions for rails           -- 106ms (+1ms)
Plugin 'vim-airline/vim-airline'          " Airline for better statusbar        -- 173ms (+67ms)
Plugin 'vim-airline/vim-airline-themes'   " Themes for Airline                  -- 148ms with both this and above (-25ms)
Plugin 'tpope/vim-surround'               " Surround for quoting/brackets/html  -- 149ms (+1ms)
Plugin 'mileszs/ack.vim'                  " Ack plugin for vim                  -- 150ms (+1ms)
Plugin 'pangloss/vim-javascript'          " Improved javascript support         -- 150ms (+0ms)
Plugin 'majutsushi/tagbar'                " Class outline viewer, seems neat    -- 152ms (+2ms)

" End vundle
call vundle#end()

" Turn filetype back on
filetype plugin indent on
