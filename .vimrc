"bundles installed pathogen
"ctrlp.vim
"elm-vim
"elm.vim
"neocomplete.vim
"nerdcommenter
"nerdtree
"syntastic
"vim-airline
"vim-colors-solarized
"vim-dispatch
"vim-fugitive
"vim-gitgutter
"vim-javascript
"vim-misc
"vim-notes
"vim-repeat
"vim-surround
"vim-unimpaired
"vim-sleuth
"vim-go



"how to change ctags dir - ctags -R -f ./.git/tags .

execute pathogen#infect()

set timeoutlen=1000 ttimeoutlen=0

"set tags
set tags=tags;

"hide buffer instead to keep history
set hidden

"give use 256 color schemes!
set term=screen-256color

"if problems try running :Helptags
"
"
"set guifont=Consolas:h11:cDEFAULT
"set guifont=Liberation_Mono_for_Powerline:h10 
"set guifont=LiberationMono\ for\ Powerline:h10 
"set encoding=utf-8
set encoding=utf-8
set guifont=Inconsolata\ for\ Powerline:h14
set t_Co=256
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L

"set line number
set relativenumber
set number

"set folding 
set foldmethod=indent 
set foldlevelstart=3
"set smartindent
filetype indent on
"for eclipselim
filetype plugin on

"removed because sleuth vim
set tabstop=4
set shiftwidth=4
"set softtabstop=4
set expandtab

"highight matches
set hlsearch

"ignore search results with spaces
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

"show bufffers and let you pick one
:nnoremap <leader>l :ls<CR>:b<space>

set ignorecase
set smartcase

"change working directory to current file directory equiv to :cd %:p:h
set autochdir

"turn built-in omni completion on
"filetype plugin on
"set omnifunc=syntaxcomplete#Complete

"pathogen addon

set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

syntax enable
set background=dark
colorscheme solarized
map <F11> :let &background = ( &background == "dark"? "light" : "dark" )<CR>

"vim fugitive
:nnoremap <leader>gs :Gstatus<CR>
:nnoremap <leader>gb :Gblame<CR>
:nnoremap <leader>gd :Gdiff<CR>

"gitgutter
highlight clear SignColumn
let g:gitgutter_max_signs = 700 

let g:syntastic_javascript_checkers = ['jshint']



let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'



"nerdtree
map <C-n> :NERDTreeToggle<CR>

"fix comments with BEM css styles --
let html_wrong_comments = 1


"neo complete settings
"note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"



"syntastic html/angular fixes
" Set up the arrays to ignore for later
if !exists('g:syntastic_html_tidy_ignore_errors')
    let g:syntastic_html_tidy_ignore_errors = []
endif

if !exists('g:syntastic_html_tidy_blocklevel_tags')
    let g:syntastic_html_tidy_blocklevel_tags = []
endif

" Try to use HTML5 Tidy for better checking?
let g:syntastic_html_tidy_exec = '/usr/local/bin/tidy5'
" AP: honestly can't remember if this helps or not
" installed with homebrew locally

" Ignore ionic tags in HTML syntax checking
" See http://stackoverflow.com/questions/30366621
" ignore errors about Ionic tags
let g:syntastic_html_tidy_ignore_errors += [
      \ "<ion-",
      \ "discarding unexpected </ion-"]

" Angular's attributes confuse HTML Tidy
let g:syntastic_html_tidy_ignore_errors += [
      \ " proprietary attribute \"ng-"]

" Angular UI-Router attributes confuse HTML Tidy
let g:syntastic_html_tidy_ignore_errors += [
      \ " proprietary attribute \"ui-sref"]

" Angular in particular often makes 'empty' blocks, so ignore
" this error. We might improve how we do this though.
" See also https://github.com/scrooloose/syntastic/wiki/HTML:---tidy
" specifically g:syntastic_html_tidy_empty_tags
let g:syntastic_html_tidy_ignore_errors += ["trimming empty "]

" Angular ignores
let g:syntastic_html_tidy_blocklevel_tags += [
      \ 'ng-include',
      \ 'ng-form'
      \ ]

" Angular UI-router ignores
let g:syntastic_html_tidy_ignore_errors += [
      \ " proprietary attribute \"ui-sref"]


let g:EclimCompletionMethod = 'omnifunc'
"eclim neocomplete settings
if !exists('g:neocomplete#force_omni_input_patterns')                                                                                                  
    let g:neocomplete#force_omni_input_patterns = {}                                                                                                   
endif                                                                                                                                                  
let g:neocomplete#force_omni_input_patterns.java =                                                                                                     
    \ '\%(\h\w*\|)\)\.\w*'


" Figure out if Python is properly configured.
try
    python 1+1
    let python_works = 1
catch /^Vim\%((\a\+)\)\=:E/ 
    let python_works = 0
endtry

" Custom formatters
if python_works
    python << EOF_PY
import json, vim, sys

def pretty_xml(x):
    """Make xml string `x` nicely formatted."""
    # Hat tip to http://code.activestate.com/recipes/576750/
    import xml.dom.minidom as md
    new_xml = md.parseString(x.strip()).toprettyxml(indent=' '*2)
    return '\n'.join([line for line in new_xml.split('\n') if line.strip()])

def pretty_json(j):
    """Make json string `j` nicely formatted."""
    return json.dumps(json.loads(j), sort_keys=True, indent=4)

prettiers = {
    'xml':  pretty_xml,
    'json': pretty_json,
    }

def pretty_it(datatype):
    b = vim.current.buffer
    content = "\n".join(b)
    content = prettiers[datatype](content)
    b[:] = str(content).split('\n')
EOF_PY

    command! Pxml :python pretty_it('xml')
    command! Pjson :python pretty_it('json')
endif

"elm env mappings

let g:syntastic_elm_checkers = ['elm_make']

let g:elm_jump_to_error = 0
let g:elm_make_output_file = "elm.js"
let g:elm_make_show_warnings = 0
let g:elm_syntastic_show_warnings = 1
let g:elm_browser_command = ""
let g:elm_detailed_complete = 0
let g:elm_format_autosave = 1
let g:elm_format_fail_silently = 0
let g:elm_setup_keybindings = 1

"disable preview
"set completeopt-=preview
"auto close preview after completion done
let g:neocomplete#enable_auto_close_preview = 1

call neocomplete#util#set_default_dictionary(
  \ 'g:neocomplete#sources#omni#input_patterns',
  \ 'elm',
  \ '\.')

"insert the current date
:nnoremap <leader>id :r! date<CR>

"gotags stuff
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }

