filetype plugin indent on
set encoding=utf-8
set nocompatible
syntax enable

silent !stty -ixon

set guioptions-=T
set guioptions-=m
"set mouse=

"tabs settings
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab

set number
set nowrap

set splitbelow

"set termwinsize=10x0

set foldmethod=syntax
syn sync fromstart


set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршдьтщзйкыегмцчня;abcdefghilmnopqrstuvwxyz

set ic
set hls

set clipboard=unnamed

call plug#begin('~/.vim/plugged')
"После добавления плагина выполнять команду :PlugInstall

Plug 'blueshirts/darcula'
Plug 'habamax/vim-polar'
""Plug 'romgrk/github-light.vim'
""Plug 'doums/darcula'
"Plug 'ajmwagar/vim-deus'
"Plug 'danilo-augusto/vim-afterglow'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
    let g:airline#extensions#keymap#enabled = 0 
    let g:airline_section_z = "\ue0a1:%l/%L Col:%c"
    let g:Powerline_symbols='unicode'
    let g:airline#extensions#xkblayout#enabled = 0
    let g:airline_powerline_fonts = 1
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#show_splits = 1
    let g:airline#extensions#tabline#switch_buffers_and_tabs = 0
    let g:airline#extensions#tabline#show_tabs = 0
    let g:airline_theme='violet'
    let g:airline_focuslost_inactive = 0
    let g:airline#extensions#nerdtree_statusline = 1

Plug 'jlanzarotta/bufexplorer'

Plug 'Valloric/YouCompleteMe'
    let g:ycm_show_diagnostics_ui = 0
    let g:ycm_enable_semantic_highlighting=1
    map <C-f> <Plug>(YCMFindSymbolInWorkspace)

Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}

Plug 'neomake/neomake'

Plug 'scrooloose/nerdtree'

Plug 'thinca/vim-quickrun'

Plug 'lervag/vimtex'
    "latex plug
    let g:tex_flavor='latex'
    let g:vimtex_view_method='zathura'
    let g:vimtex_quickfix_mode=0
    "set conceallevel=0
    "let g:tex_conceal='abdmg'
Plug 'KeitaNakamura/tex-conceal.vim'

Plug '907th/vim-auto-save'

Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'

call plug#end()


:function LightColorScheme ()
    set termguicolors
    colorscheme polar
    set termguicolors
    ""let g:Lightline.colorscheme = 'github-light'
endfunction

:function DarkColorScheme ()
    colorscheme darcula
    set notermguicolors
    ""let g:airline_theme='violet'
endfunction

call DarkColorScheme()

let g:UltiSnipsExpandTrigger="<f4>"
let g:UltiSnipsJumpForwardTrigger="<f4>"
let g:UltiSnipsJumpBackwardTrigger="<f3>"
let g:UltiSnipsSnippetDirectories=["MySnippets"]

map <C-n> :NERDTreeToggle<CR>

set conceallevel=2
set concealcursor-=n
let g:tex_conceal='abdmg'
hi Conceal ctermbg=none


augroup tex autocmd!
    au BufNewFile,BufRead *.tex setlocal spell spelllang=en_us,ru_ru
    au BufNewFile,BufRead *.tex setlocal wrap linebreak
augroup END

augroup README autocmd!
    au BufNewFile,BufRead *.md setlocal spell spelllang=en_us,ru_ru
    au BufNewFile,BufRead *.md setlocal wrap linebreak
augroup END

augroup glsl autocmd!
    au BufNewFile,BufRead *.vert setlocal syntax=cpp
    au BufNewFile,BufRead *.frag setlocal syntax=cpp

    au BufNewFile,BufRead *.vert setlocal smartindent
    au BufNewFile,BufRead *.frag setlocal smartindent
augroup END

let g:auto_save = 1
let g:auto_save_events = ["TextChanged", "TextChangedI"]

autocmd vimenter * NERDTree


augroup _ino autocmd!
    au BufNewFile,BufRead *.ino setlocal smartindent
augroup END


:function! IsValidBuffer(index)
    return !empty(bufname(a:index)) && empty(getbufvar(a:index, '&buftype')) && (getbufinfo(a:index)[0].listed)
endfunction

:function! NextBuffer()
  let ind = bufnr()
  let ind += 1
  while ind != bufnr()
    if ind > bufnr('$')
      let ind = 1
    endif
    if IsValidBuffer(ind)
      break
    else
      let ind += 1
    endif
  endwhile
  execute "buffer" ind
endfunction

:function! PreviousBuffer()
  let ind = bufnr()
  let ind -= 1
  while ind != bufnr()
    if ind < 1
      let ind = bufnr('$')
    endif
    if IsValidBuffer(ind)
      break
    else
      let ind -= 1
    endif
  endwhile
  execute "buffer" ind
endfunction

:function! DeleteBuffer()
    let ind = bufnr()
    call NextBuffer()
    execute "bw" ind
endfunction

:function ShowBuffers()
    let ind = bufnr()
    let ind += 1
    while ind != bufnr()
        echo bu
endfunction
        

nnoremap <Tab>l :w!<CR>:call NextBuffer()<CR>
nnoremap <Tab>h :w!<CR>:call PreviousBuffer()<CR>
nnoremap <Tab>d :w!<CR>:call DeleteBuffer()<CR>

nnoremap <Tab>д :w!<CR>:call NextBuffer()<CR>
nnoremap <Tab>р :w!<CR>:call PreviousBuffer()<CR>
nnoremap <Tab>в :w!<CR>:call DeleteBuffer()<CR>


nnoremap j gj
nnoremap k gk
nnoremap о gj
nnoremap л gk

vnoremap j gj
vnoremap k gk
vnoremap о gj
vnoremap л gk


noremap <C-z> :<CR>


runtime MyPlugs/PlugsLoad.vim
"vmap <C-c> y:e ~/clipsongzboard<CR>P:w !pbcopy<CR><CR>:bdelete!<CR>

packadd termdebug

