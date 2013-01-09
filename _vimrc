"for Vim terminal version.
if !has('gui_macvim')
    :syntax enable
    "colorscheme default
    let g:jasmine_helper_spec_dir = ''
    set background=dark
    colorscheme wombat
endif

"map settings.
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
"nnoremap <tab> f=2l
"nnoremap <s-tab> 2F=2l

nnoremap <D-i> <ESC>
inoremap <D-i> <ESC>
vnoremap <D-i> <ESC>
cnoremap <D-i> <ESC>
onoremap <D-i> <ESC>
inoremap <D-o> <C-o>

inoremap <expr> j getline('.')[col('.') -2] ==# 'j' ? "\<BS>\<ESC>" : 'j'
" cnoremap <expr> j getcmdline()[getcmdpos() - 2] ==# 'j' ? "\<BS>\<ESC>" : 'j' 

inoremap <DS-Enter> <C-p>
nnoremap <C-i> <C-i>

":only
nnoremap <silent> <Space>o :<C-u>on<CR>

"line merge
nnoremap <silent> <Space><Space>j JxJx

"paste
inoremap <silent> <C-p> <C-r>x

"move window
nnoremap <silent> <Space>h <C-w>h
nnoremap <silent> <Space>k <C-w>k
nnoremap <silent> <Space>l <C-w>l
nnoremap <silent> <Space>j <C-w>j
"
nnoremap <Space>; f=2l
nnoremap <Space>: 2F=2l
nnoremap <space>a ggVG

"expand window
nnoremap <silent> <Space><Space><Space>j <C-w>+
nnoremap <silent> <Space><Space>k <C-w>-
nnoremap <silent> <Space><Space>h <C-w><
nnoremap <silent> <Space><Space>l <C-w>>

"save page
nnoremap <silent> <Space>s :w<CR>

"quit window
nnoremap <silent> <Space>d :q<CR>

"new tab
nnoremap <silent> \t :<C-u>tabnew<CR>

"tag jump
nnoremap <silent> <space>t <C-]>

"open to browser
nnoremap <silent> <leader>w :silent ! open %<CR>

"move tab
nnoremap gh gT
nnoremap gl gt

"Search
nnoremap n nzz
nnoremap N Nzz

"window move
nnoremap L Lzz
vnoremap L Lzz
nnoremap <C-L> L
vnoremap <C-L> L
nnoremap H Hzz
vnoremap H Hzz
nnoremap <C-H> H
vnoremap <C-H> H
nnoremap zk zb
nnoremap zj zt

nnoremap <silent> \\ :<C-u>noh<CR>

"expand * command for visual mode.
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v,'\/'),"\n",'\\n','g')<CR><CR>

"file jump as new tab.
nnoremap gF <C-W>gf

"NEADTree settings
nnoremap <silent> <space>ft :NERDTreeFind<CR>

"set cursorline arias.
command! Setcl :set cursorline

"Fuf setting
nnoremap <silent> <space>fb :FufBuffer!<CR>
nnoremap <silent> <space>ff :FufFile! <C-r>=expand('%:~:.')[:-1-len(expand('%:~:.:t'))]<CR><CR>
nnoremap <silent> <space>fd :FufDir! <C-r>=expand('%:p:~')[:-1-len(expand('%:p:~:t'))]<CR><CR>
nnoremap <silent> <space>fm :FufMruFile<CR>
nnoremap <silent> <Space>fc :FufRenewCache<CR>
autocmd FileType fuf nmap <C-c> <ESC>
let g:fuf_patternSeparator = ' '
let g:fuf_modesDisable = ['mrucmd']
let g:fuf_mrufile_exclude = '\v\.DS_Store|\.git|\.swp|\.svn'
let g:fuf_mrufile_maxItem = 100
let g:fuf_enumeratingLimit = 20
let g:fuf_file_exclude = '\v\.DS_Store|\.git|\.swp|\.svn'

"set expand key for zen-coding
"let g:user_zen_expandabbr_key='<c-enter>'
let g:user_zen_expandabbr_key='<d-enter>'


"--------------------------------------------------------------------------------
" neocomplcach settings.
"--------------------------------------------------------------------------------
" Disable AutoComplPop.
"let g:acp_enableAtStartup = 0
"" Use neocomplcache.
"let g:neocomplcache_enable_at_startup = 1
"" Use smartcase.
"let g:neocomplcache_enable_smart_case = 1
"" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
"" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1
"" Set minimum syntax keyword length.
"let g:neocomplcache_min_syntax_length = 3
"let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
"
"" Define dictionary.
"let g:neocomplcache_dictionary_filetype_lists = {
"    \ 'default' : '',
"    \ 'vimshell' : $HOME.'/.vimshell_hist',
"    \ 'scheme' : $HOME.'/.gosh_completions'
"    \ }
"
"" Define keyword.
"if !exists('g:neocomplcache_keyword_patterns')
"  let g:neocomplcache_keyword_patterns = {}
"endif
"let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
"
"" Plugin key-mappings.
"imap <D-k>     <Plug>(neocomplcache_snippets_expand)
"smap <D-k>     <Plug>(neocomplcache_snippets_expand)
"inoremap <expr><C-g>     neocomplcache#undo_completion()
"inoremap <expr><C-l>     neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
"" <TAB>: completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"" <C-h>, <BS>: close popup and delete backword char.
"inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
"inoremap <expr><C-y>  neocomplcache#close_popup()
"inoremap <expr><C-e>  neocomplcache#cancel_popup()

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

"cursor line highlight
"autocmd FocusGained *.* :set cursorline
"autocmd WinEnter *.* :set cursorline
"autocmd CmdwinEnter *.* :echo 'hoge'
autocmd CursorMoved *.* :set cursorline

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'















" neocomplcache
"let g:neocomplcache_enable_at_startup = 1
"let g:neocomplcache_max_list = 30
"let g:neocomplcache_auto_completion_start_length = 2
"let g:neocomplcache_enable_smart_case = 1
"let g:acp_enableAtStartup = 0
"
""" like AutoComplPop
"let g:neocomplcache_enable_auto_select = 1
""" search with camel case like Eclipse
"let g:neocomplcache_enable_camel_case_completion = 1
"let g:neocomplcache_enable_underbar_completion = 1
""imap <C-k> <Plug>(neocomplcache_snippets_expand)
""smap <C-k> <Plug>(neocomplcache_snippets_expand)
"inoremap <expr><C-g> neocomplcache#undo_completion()
"inoremap <expr><C-l> neocomplcache#complete_common_string()
""" SuperTab like snippets behavior.
""imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"
"imap <C-k> <Plug>(neocomplcache_snippets_expand)
"smap <C-k> <Plug>(neocomplcache_snippets_expand)
"
""" <CR>: close popup and save indent.
""inoremap <expr><CR> neocomplcache#smart_close_popup() . (&indentexpr != '' ? "\<C-f>\<CR>X\<BS>":"\<CR>")
"inoremap <expr><CR> pumvisible() ? neocomplcache#close_popup() : "\<CR>"
""" <TAB>: completion.
"inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
""" <C-h>, <BS>: close popup and delete backword char.
"inoremap <expr><C-h> neocomplcache#smart_close_popup() . "\<C-h>"
"inoremap <expr><BS> neocomplcache#smart_close_popup() . "\<C-h>"
"inoremap <expr><C-y> neocomplcache#close_popup()
"inoremap <expr><C-e> neocomplcache#cancel_popup()




"runtimepath setting
set runtimepath+=$VIM/runtime/after
set runtimepath+=$HOME/.vim/runtime/
set runtimepath+=$HOME/.vim/neocomplcache/

"PATH setting
"let &path = '/opt/local/bin',$path
"let $JSX="/Users/hiruma-kazuya/MyDesktop/github/JSX/bin"
"let $NODE="/Users/hiruma-kazuya/.nvm/v0.6.17/bin/node"
"let $PATH=$JSX . ":" . $NODE . ":" . $PATH


"êîílé¿ë‘éQè∆ÇÃïœä∑
vmap <silent> sn :Str2NumChar<CR> 
vmap <silent> sh :Str2HexLiteral<CR> 


nnoremap <Space>y "xy
vnoremap <Space>y "xy
nnoremap <Space>P "xP
nnoremap <Space>p "xp
vnoremap <Space>P "xP
vnoremap <Space>p "xp
nnoremap <silent> <Space>r :let @x = @@<CR>

"insert comment to end tag
function! Endtagcomment()
    let reg_save = @@

    try
        silent normal vaty
    catch
        execute "normal \<Esc>"
        echohl ErrorMsg
        echo 'no match html tags'
        echohl None
        return
    endtry

    let html = @@

    let start_tag = matchstr(html, '\v(\<.{-}\>)')
    let tag_name  = matchstr(start_tag, '\v([a-zA-Z]+)')

    let id = ''
    let id_match = matchlist(start_tag, '\vid\=["'']([^"'']+)["'']')
    if exists('id_match[1]')
        let id = '#' . id_match[1]
    endif

    let class = ''
    let class_match = matchlist(start_tag, '\vclass\=["'']([^"'']+)["'']')
    if exists('class_match[1]')
        let class = '.' . join(split(class_match[1], '\v\s+'), '.')
    endif

    execute "normal `]va<\<Esc>`<"

    let comment = g:endtagcommentFormat
    let comment = substitute(comment, '%id', id, 'g')
    let comment = substitute(comment, '%class', class, 'g')
    let @@ = comment

    normal ""P

    let @@ = reg_save
endfunction

let g:endtagcommentFormat = '<!-- /%id%class -->'
nnoremap ,t :<C-u>call Endtagcomment()<CR>


"toggle comment to CSS
function! LineCommentCSS()
    let reg_save = @@

    silent normal ^v$hy
    let css = @@
    let chk = matchstr(css, '\v^/\*')
    if chk == '/*'
        let comment = matchlist(css, '\v/\*(.*)\*/')
        let @@ = comment[1]
        silent normal ^""PlD
    else
        let css = '/*' . css . '*/'
        let @@ = css
        normal ""PlD
    endif

    let @@ = reg_save
endfunction
nnoremap ,c :<C-u>call LineCommentCSS()<CR>

function! CSS3PropertyDuplicate()
  let reg_save = @@

  silent normal Y
  let css3 = @@
  let ind = matchlist(css3, '\v(\s*)(.*)')
  let webkit = ind[1] . "-webkit-" . ind[2]
  let moz    = ind[1] . "-moz-"    . ind[2]
  let ms     = ind[1] . "-ms-"     . ind[2]
  let o      = ind[1] . "-o-"      . ind[2]

  let @@ = webkit . moz . ms . o
  normal ""P

  let @@ = reg_save
endfunction
nnoremap ,3 :<C-u>call CSS3PropertyDuplicate()<CR>

"jump to end tag.
function! JumpTag()
    let save_reg = @@
    normal yy

    let chk = @@
    let chk = matchstr(chk, '\v(\</.*\>)')
    execute "normal ^vat\<ESC>"

    if chk != ''
        normal `<
    else
        normal `>
    endif

    let @@ = save_reg
    let @* = save_reg
endfunction

"nnoremap <silent> <Space>t :<C-u>call JumpTag()<CR>
"nnoremap <silent> <Space>t :normal %<CR>

"output JS document
"function! OjsdocRun()
"  execute "!jsdoc ."
"endfunction
"
"command! -nargs=0 Ojsdoc :call OjsdocRun()



"input br tag.
imap <s-enter> <br />
nnoremap <s-enter> :normal $a<br />
"imap { {}<LEFT>
"imap [ []<LEFT>
"imap ( ()<LEFT>

"expand visual mode function.
nnoremap <silent> vi_ T_vt_
nnoremap <silent> ci_ T_vt_c
nnoremap <silent> di_ T_vt_d
nnoremap <silent> da_ F_vf_d
nnoremap <silent> yi_ T_vt_y
nnoremap <silent> vac $va{o^
nnoremap <silent> dac $va{o^d
nnoremap <silent> yac $va{o^y
nnoremap <silent> vic $vi{
nnoremap <silent> dic $vi{d
nnoremap <silent> yic $vi{y

nnoremap <silent> vaac $va{o?}<CR>l


"jump to middle position on column.
function! JumpCenter()
    normal $
    let end = col(".")
    let colm = &columns
    if colm < end
        let end = colm
    endif
    let to = end / 2
    call cursor(0,to)
endfunction

nnoremap <silent> <space>m :<C-u>call JumpCenter()<CR>


"set to load file.
"source $VIM/vimfiles/macros/ambsearch-20040211/ambsearch.vim
"call AmbsearchLoad("katakana")
"call AmbsearchLoad("jyouyou")

"enable function of jumping end tag.
source $VIMRUNTIME/macros/matchit.vim

"set statusline
set statusline=%f%m%r%h%w[%n%{winnr('$')>1?':'.winnr().'/'.winnr('$'):''}]%=%{&fileencoding}(%{&fileformat})%6l/%L,%c%V%6P

"SVN move
command! Svn :cd %:h

"--------------------------------------------------
" sass settings.
"--------------------------------------------------
"function! Sass_convert()
"    let scss = expand('%:p')
"    let filename = expand('%:t:r')
"    let scsspath = substitute(scss, '\v(/.*)/(.*)', '\1', '')
"    let parent = substitute(scsspath, '\v(/.*)/(.*)', '\1', '')
"    let css  = parent . '/' . filename . '.css'
"    let cmd  = printf('sass -t compressed %s %s &', scss, css)
"    let res  = system(cmd)
"    if res != ''
"        echo res
"    endif
"endfunction
"au! BufWritePost *.scss call Sass_convert()

"ad *.md setf md
autocmd BufRead,BufNewFile *.mkd  setfiletype mkd
autocmd BufRead,BufNewFile *.md  setfiletype mkd


"split tags.
nnoremap ,b execute(':<C-u>s;\(<.\{-}>\)\(.*\)\(</.*>\);\1\2\3;<CR>')

"setting for environment.
set nobackup
set nu

"IME setting
set iminsert=0
set imsearch=-1


"ÉJÅ[É\ÉãçsÇÃÉnÉCÉâÉCÉg
set cursorline

"ÉJÉåÉìÉgÉEÉBÉìÉhÉEÇÃÇ›Ç…â∫ê¸Çà¯Ç≠
augroup cch
autocmd! cch
autocmd WinLeave * set nocursorline
autocmd WinEnter , BufRead * set cursorline
augroup END

:hi clear CursorLine
:hi CursorLine gui=underline
highlight CursorLine ctermbg=black guibg=black

"tab settings.
set cindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

"é©ìÆâ¸çsÇÉIÉtÇ…
set tw=0


"clipboard
"set clipboard=unnamed

"pathogen.vim setting.
"if !has('gui_macvim')
call pathogen#runtime_append_all_bundles()
"endif

"vimshell setting
let g:VimShell_EnableInteractive = 1

"ignore case off when type the UpperCase on search
set smartcase

"tags file include.
"set tags=./tags,/usr/src/tags,~/.tags

let g:outputz_secret_key = 'OFloI5J-_Xhn'
let g:outputz_uri = 'http://outputz.com/api/post'

set nosmartindent

"undisplaied toolbar.
set guioptions-=T


"Qfreplace
if !exists('b:undo_ftplugin')
  let b:undo_ftplugin = ''
endif
let b:undo_ftplugin .= '| execute "delcommand Qfreplace"'


command! -nargs=? -buffer Qfreplace call qfreplace#start(<q-args>)

"tags setting
let g:SrcExpl_UpdateTags = 1
let g:SrcExpl_updateTagsCmd = "ctags -R ."


"Project vim settings.
" ÉtÉ@ÉCÉãÇ™äJÇ©ÇÍÇΩÇÁÉEÉBÉìÉhÉEÇï¬Ç∂ÇÈ
let g:proj_flags = 'imstc'

" <Leader>PÇ≈ÅAÉvÉçÉWÉFÉNÉgÇÉgÉOÉãÇ≈äJï¬Ç∑ÇÈ
:nnoremap <silent> <Leader>P <Plug>ToggleProject

" <Leader>pÇ≈ÅAÉfÉtÉHÉãÉgÇÃÉvÉçÉWÉFÉNÉgÇäJÇ≠
:nnoremap <silent> <Leader>p :Project<CR>

"if getcwd() != $HOME
"    if filteradable(getcwd() . '/.vimprojects')
"        Project .vimprojects
"    endif
"endif


"Vundle settings.
set nocompatible
filetype off

set rtp+=~/.vim/vundle.git/
call vundle#rc()

" original repos on github
Bundle 'tpope/vim-surround'
Bundle 'thinca/vim-qfreplace'
"Bundle 'motemen/git-vim'
Bundle 'tpope/vim-fugitive'
Bundle 'mattn/zencoding-vim'
Bundle 'scrooloose/nerdtree'
Bundle 'basyura/jslint.vim'
Bundle 'hokaccha/vim-html5validator'
"Bundle 'tanabe/WriteJSDocComment.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'Lokaltog/vim-powerline'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'gregsexton/VimCalc'
Bundle 'AtsushiM/RetinaResize'
Bundle 'AtsushiM/auto-make.vim'
Bundle 'ack.vim'
Bundle 'jsx/jsx.vim.git'
Bundle 'AtsushiM/jasmine-helper.vim'
Bundle 'leafgarland/typescript-vim.git'


" vim-scripts repos
"Bundle 'l9.vim'

" non github repos
"Bundle 'git://git.wincent.com/command-t.git'

filetype plugin indent on


" jslint.vim
function! s:javascript_filetype_settings()
  autocmd BufLeave     <buffer> call jslint#clear()
  autocmd BufWritePost <buffer> call jslint#check()
  autocmd CursorMoved  <buffer> call jslint#message()
endfunction
autocmd FileType javascript call s:javascript_filetype_settings()

" Enable folding.
"set foldenable
"set foldmethod=indent
"set foldcolumn=3

let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#090909   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#0c0c0c ctermbg=4
autocmd FileType jsx compiler jsx

autocmd BufWritePost *.coffee silent CoffeeMake! -cb | cwindow | redraw!

"RetinaResize settings.
let g:RetinaResize_Comment = 0


"srcexpl settings.
let g:SrcExpl_RefreshTime = 1
let g:SrcExpl_UpdateTags = 1

"------------------------------------------
" for auto-make.vim
"------------------------------------------
let g:auto_make_file = ['js']

" search directory depth.
let g:auto_make_cdloop = 3
let g:auto_make_makefile = 'Makefile'

" é¿çsÇ∑ÇÈÉRÉ}ÉìÉh
" ÉGÉâÅ[ï\é¶Ç»Çµ(ÉoÉbÉNÉGÉìÉhé¿çs)
" let g:auto_make_cmd = 'make&'

" ÉGÉâÅ[ï\é¶Ç†ÇË
let g:auto_make_cmd = 'make'

" growlÇ≈í ím(óvÅFgrowlnotifyÉCÉìÉXÉgÅ[Éã)
let g:auto_make_cmd = "make|growlnotify -t 'auto-make' -m 'make complete.'&"

" wildignorecase
if has('gui_macvim')
    wildmode=list:full
endif
