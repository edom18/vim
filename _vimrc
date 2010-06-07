"map settings.
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
nnoremap + $
vnoremap + $
nnoremap <tab> f=2l
nnoremap <s-tab> 2F=2l

"vnoremap <tab> <C-p>
"vnoremap <s-tab> <C-n>

nnoremap <space>a ggVG

":only
nnoremap <silent> <Space>o :<C-u>on<CR>
"paste
inoremap <silent> <C-p> <C-r>x

"move window
nnoremap <silent> <Space>h <C-w>h
nnoremap <silent> <Space>k <C-w>k
nnoremap <silent> <Space>l <C-w>l
nnoremap <silent> <Space>j <C-w>j

"move tab
nnoremap gh gT
nnoremap gl gt

"Search
nnoremap n nzz
nnoremap N Nzz

"window move
nnoremap L Lzz
nnoremap <C-L> L
nnoremap H Hzz
nnoremap <C-H> H
nnoremap zk zb
nnoremap zj zt

"defined default directory.
let $dt = 'C:\Documents and Settings\hiruma-kazuya\デスクトップ\'
let $dt2 = 'C:\Documents and Settings\えど\デスクトップ\'

"move to tmp directory.
let $tmpdir = 'C:\tmp\vim'
let $temp = 'C:\works\temp'

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
let g:user_zen_expandabbr_key='<c-enter>'

"supertab setting.
let g:SuperTabMappingForward = "<s-tab>"
let g:SuperTabMappingBackward = "<tab>"

"set path for SVN
let $PATH = 'C:\Program Files\Subversion\bin;' . $PATH

"runtimepath setting
set runtimepath+=$VIM/runtime/after

"数値実態参照の変換
vmap <silent> sn :Str2NumChar<CR> 
vmap <silent> sh :Str2HexLiteral<CR> 


"nnoremap y "xy
"vnoremap y "xy
"nnoremap d "xd
"vnoremap d "xd
"nnoremap c "xc
"vnoremap c "xc
"nnoremap p "xp
"nnoremap P "xP
"vnoremap p "xp
"nnoremap x "xx
"vnoremap x "xx
"nnoremap <Space>y "*y
"vnoremap <Space>y "*y
"nnoremap <Space>P "*P
"nnoremap <Space>p "*p
nnoremap <Space>y "xy
vnoremap <Space>y "xy
nnoremap <Space>P "xP
nnoremap <Space>p "xp


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

"jump to end tag.
function! JumpTag()
    let save_reg = @@
    let save_reg2 = @x
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
    let @x = save_reg2
endfunction

nnoremap <silent> <Space>t :<C-u>call JumpTag()<CR>


"input br tag.
imap <s-enter> <br /><CR>

"expand visual mode function.
nnoremap <silent> vi_ T_vt_
nnoremap <silent> ci_ T_vt_c
nnoremap <silent> di_ T_vt_d
"nnoremap <silent> yi_ T_vt_"xy
nnoremap <silent> yi_ T_vt_y
nnoremap <silent> vac $va{o^
"nnoremap <silent> dac $va{o^"xd
"nnoremap <silent> yac $va{o^"xy
nnoremap <silent> dac $va{o^d
nnoremap <silent> yac $va{o^y
nnoremap <silent> vic $vi{
"nnoremap <silent> dic $vi{"xd
"nnoremap <silent> yic $vi{"xy
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
source $VIM/vimfiles/macros/ambsearch-20040211/ambsearch.vim
call AmbsearchLoad("katakana")
call AmbsearchLoad("jyouyou")

"enable function of jumping end tag.
source $VIMRUNTIME/macros/matchit.vim

"set statusline
set statusline=%f%m%r%h%w[%n%{winnr('$')>1?':'.winnr().'/'.winnr('$'):''}]%=%{&fileencoding}(%{&fileformat})%6l/%L,%c%V%6P

"test block.

