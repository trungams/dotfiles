" Set compatibility to Vim only.
" set nocompatible

" Helps force plug-ins to load correctly when it is turned back on below.
" filetype off

" Turn on syntax highlighting.
syntax on

" Turn off modelines
set modelines=0

" Automatically wrap text that extends beyond the screen length.
set wrap
" Vim's auto indentation feature does not work properly with text copied from outisde of Vim. Press the <F2> key to toggle paste mode on/off.
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>

" Uncomment below to set the max textwidth. Use a value corresponding to the width of your screen.
" set textwidth=79
set formatoptions=tcqrn1
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set noshiftround
set autoindent
filetype indent on
set cindent

" Display 5 lines above/below the cursor when scrolling with a mouse.
set scrolloff=5
" Fixes common backspace problems
set backspace=indent,eol,start

" Speed up scrolling in Vim
set ttyfast

" Status bar
set laststatus=2

" Display options
set showmode
set showcmd

" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>

" Display different types of white spaces.
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

" Show line numbers
set number

" Encoding
set encoding=utf-8

" Highlight matching search patterns
set hlsearch
" Enable incremental search
set incsearch
" Include matching uppercase words with lowercase search term
set ignorecase
" Include only uppercase words with uppercase search term
set smartcase

" Store info from no more than 100 files at a time, 9999 lines of text, 100kb of data. Useful for copying large amounts of data between files.
set viminfo='100,<9999,s100

" Map the <Space> key to toggle a selected fold opened/closed.
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" Automatically save and load folds
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview"

" Folding functions
"set foldmethod=indent
"set foldlevel=1
"set foldclose=all

" word count
function WordCount()
  let s:old_status = v:statusmsg
  let position = getpos(".")
  exe "silent normal g\<c-g>"
  let stat = v:statusmsg
  let s:word_count = 0
  if stat != '--No lines in buffer--'
    let s:word_count = str2nr(split(v:statusmsg)[11])
    let v:statusmsg = s:old_status
  end
  call setpos('.', position)
  return s:word_count
endfunction

" Set status line display
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ [WC=%{WordCount()}]\ %{strftime('%c')}

autocmd FileType c,cpp,java,js,html,css setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab smarttab
autocmd FileType c,cpp,java,js map <buffer> = <Plug>(operator-clang-format)

" Pathogen stuff start
"execute pathogen#infect()
"syntax on
"filetype plugin indent on
" Pathogen stuff done

" NerdTree start
" some key bindings
"nnoremap <leader>n :NERDTreeFocus<CR>
"nnoremap <C-n> :NERDTreeToggle<CR>
"nnoremap <C-f> :NERDTreeFind<CR>

" Exit Vim if NERDTree is the only window left.
"autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
"    \ quit | endif
" NerdTree end

