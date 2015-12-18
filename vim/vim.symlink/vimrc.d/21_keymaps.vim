" NB: the leader is set in 01_init.vim because it must be set before loading
" plugins.

" map ; to :
nnoremap ; :
vnoremap ; :

" map ` to ' and vice-versa
nnoremap ` '
nnoremap ' `

" map j and k to move inside wrapped lines
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" Toggle line wrap
nnoremap <silent> <leader>w :set wrap!<CR>


" Fast editing of the .vimrc
nnoremap <leader>e :e! ~/.vimrc<cr>

" Map <leader>c[x|c|v] to system clipboard
vnoremap <leader>cx "+d
vnoremap <leader>cc "+y
vnoremap <leader>cv "+p
nnoremap <leader>cv "+p

" highlight the current line with <leader>h, and have the highlighting stay
" where it is when the cursor is moved. Delete with :match or <leader>H
nnoremap <silent> <Leader>h ml:execute 'match Search /\%'.line('.').'l/'<CR>
nnoremap <silent> <Leader>H ml:execute 'match'<CR>

" Map space to / (search) and c-space to ? (backgwards search)
map <space> /
map <c-space> ?
map <silent> <leader><cr> :nohlsearch<cr>

""""""""""""""""""""""""""""""
" => Tabs related
""""""""""""""""""""""""""""""

map <leader>tt :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmove

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""

"  In visual mode when you press * or # to search for the current selection
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSearch('gv')<CR>
map <leader>G :vimgrep // **/*.<left><left><left><left><left><left><left>

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

" From an idea by Michael Naumann
function! VisualSearch(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Command mode related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Smart mappings on the command line
cno $h e ~/
cno $d e ~/Desktop/
cno $j e ./
cno $c e <C-\>eCurrentFileDir("e")<cr>

" $q is super useful when browsing on the command line
" commented out, provided by default <C-w>
" cno $q <C-\>eDeleteTillSlash()<cr>

" Bash like keys for the command line
" cnoremap <C-A>      <Home>
" cnoremap <C-E>      <End>
" cnoremap <C-K>      <C-U>

" cnoremap <C-P> <Up>
" cnoremap <C-N> <Down>

" Useful on some European keyboards
map ½ $
imap ½ $
vmap ½ $
cmap ½ $

func! Cwd()
  let cwd = getcwd()
  return "e " . cwd 
endfunc

" func! DeleteTillSlash()
"   let g:cmd = getcmdline()
" "  if MySys() == "linux" || MySys() == "mac"
"     let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*", "\\1", "")
" "  else
" "    let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\]\\).*", "\\1", "")
" "  endif
"   if g:cmd == g:cmd_edited
" "    if MySys() == "linux" || MySys() == "mac"
"       let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*/", "\\1", "")
" "    else
" "      let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\\]\\).*\[\\\\\]", "\\1", "")
" "    endif
"   endif
"   return g:cmd_edited
" endfunc

func! CurrentFileDir(cmd)
  return a:cmd . " " . expand("%:p:h") . "/"
endfunc


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Remap VIM 0
map 0 ^

"Move a line of text using CTRL+[jk]
nmap <C-j> mz:m+<cr>`z
nmap <C-k> mz:m-2<cr>`z
vmap <C-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <C-k> :m'<-2<cr>`>my`<mzgv`yo`z

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Cope
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Do :help cope if you are unsure what cope is. It's super useful!
map <leader>bc :botright cope<cr>
map <leader>n :cn<cr>
map <leader>p :cp<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

"Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

"""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""

" Use <Leader>1 to open NERDTree
"noremap <silent> <Leader>1 :NERDTreeToggle<Return>
noremap <silent> <Leader>1 :NERDTreeTabsToggle<Return>

" Bind <Leader>2 to show taglist
nnoremap <silent> <Leader>2 :TlistToggle<CR>

" Bind <Leader>3 to show YankRing
nnoremap <silent> <Leader>3 :YRShow<CR>

" Bind <Leader>4 to show Gundo
nnoremap <silent> <Leader>4 :GundoToggle<CR>

" Command-T
" nnoremap <silent> <Leader>t :CommandT<CR>
" nnoremap <silent> <Leader>b :CommandTBuffer<CR>

" <leader>l to goggle between absolute, relative and no line numbers
nnoremap <silent> <leader>l :exec &nu == &rnu ? "se nu!" : "se rnu!"<cr>

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Toggle paste mode
noremap <silent> <leader>pp :setlocal paste!<cr>
