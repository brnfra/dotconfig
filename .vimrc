" Arquivo:.vimrc
" Autor: Bruno Franco
" Ultima_modificacao:Fri 06 Mar 2020 11:53:54 PM -03
" Download: git@github.com:brnfra
" Licence:Este arquivo é de domínio público
" Garantia: O autor não se responsabiliza por eventuais danos
"           causados pelo uso deste arquivo.
"
"Maps;
"<BAR>       - |
"<leader>    - ;
"<C-w>       - Ctrl + w
"<CR>        - Enter(confirma)
"<S-w>       - Shift + w
"<F1>        - F1
"Nerd-Fonts  - https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/RobotoMono.zip
"PATH(Debian)- placing FONTS them into /usr/local/share/fonts (system-wide), ~/.local/share/fonts (user-specific)


"-------------------------------------------------------
"                  System Config {{{
"-------------------------------------------------------


let g:dl1 = '/home/devlab/.vim/autoload'
let g:dl2 = '/home/devlab/.vim/bundle'


let g:dw1 = 'C:\Program Files\Vim\vim82\autoload'
let g:dw2 = 'C:\Program Files\Vim\vim82\bundle'


if has('unix')
     

	autocmd VimEnter * echo "Seja bem vindo ao vim. Seu sistema é Unix!"
	":AddBase"
    :command AddBase call Base(dl1,dl2)<CR>

elseif (has('win32') || has('win64'))

	autocmd VimEnter * echo "Seja bem vindo ao vim. Seu sistema é Windows!"
    :command AddBase call Base(dw1,dw2)<CR>
endif

if has('unix')
   "-------------------------------------------------------
    "                   Plugins Install
    "-------------------------------------------------------
  

  function! Base(dl1,dl2) abort
      echo 'Checando diretorios'
      "Caminho completo necessário
      "autoload
        let dir1 =  empty(glob(a:dl1))
        "bundle
        let dir2 =  empty(glob(a:dl2))
        

        if (dir1 || dir2)
          "echo "Diretorios Presentes. Baixando pathogen e criando diretorio mylivim..."
          silent exec "!mkdir -p ".a:dl1." " a:dl2." ".'/home/devlab/.vim/bundle/control-vim'  

        
         "force redraw screen
          silent exec "redraw!"  
        
          "alterando diretorio corrente
          ""silent exec 'cd' a:dl2
          "download control-vim
          ""silent exec '!git clone https://github.com/brnfra/control-vim.git'
           
        else
                     
           silent echo 'Repositórios locais já foram criados'
           "force redraw screen
          silent exec "redraw!"  
                      
                
        endif

       "Option - 1) junegunn /vim-plug "

         if !filereadable("plug.vim")

            silent exec 'cd' a:dl1
            silent exec "!curl -fLo ~/.vim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
       
        endif

       "Option - 2) pathogen /vim-pathogen "

    ""    if !filereadable("pathogen.vim")

   ""       silent exec 'cd' a:dl1
               "silent exec "!curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim"
        
   ""      endif 


  endfunction


elseif (has('win32') || has('win64'))


	
	"-------------------------------------------------------"
	"		Set System
	"		Original file _vimrc windows
	"-------------------------------------------------------
				

	" Vim with all enhancements
	source $VIMRUNTIME/vimrc_example.vim

	" Use the internal diff if available.
	" Otherwise use the special 'diffexpr' for Windows.
	if &diffopt !~# 'internal'
	  set diffexpr=MyDiff()
	endif
	function MyDiff()
	  let opt = '-a --binary '
	  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
	  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
	  let arg1 = v:fname_in
	  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
	  let arg1 = substitute(arg1, '!', '\!', 'g')
	  let arg2 = v:fname_new
	  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
	  let arg2 = substitute(arg2, '!', '\!', 'g')
	  let arg3 = v:fname_out
	  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
	  let arg3 = substitute(arg3, '!', '\!', 'g')
	  if $VIMRUNTIME =~ ' '
		if &sh =~ '\<cmd'
		  if empty(&shellxquote)
			let l:shxq_sav = ''
			set shellxquote&
		  endif
		  let cmd = '"' . $VIMRUNTIME . '\diff"'
		else
		  let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
		endif
	  else
		let cmd = $VIMRUNTIME . '\diff'
	  endif
	  let cmd = substitute(cmd, '!', '\!', 'g')
	  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
	  if exists('l:shxq_sav')
		let &shellxquote=l:shxq_sav
	  endif
	endfunction

                 
    "-------------------------------------------------------
    "                   Plugins Install
    "-------------------------------------------------------
    "	
	"Init it folder Win32 
	"Set your WORKDIR on windows systems :Vexplore
	"local C:\Program Files\Vim\_vimrc
	"autocmd VimEnter * :silent e C:\Users\Bruno\Documents
	"autocmd VimEnter * :silent e C:\"Program Files"\Vim\vim82\bundle
	
	"check diretorios	
 

  function! Base(dw1,dw2) abort
      echo 'Checando diretorios'
      "Caminho completo necessário
      "autoload
        let dir1 =  empty(glob(a:dw1))
        "bundle
        let dir2 =  empty(glob(a:dw2))


        "echo "Checando diretorios"
            let dir1 = empty(glob('C:\Program Files\Vim\vim82\autoload'))
            let dir2 = empty(glob('C:\Program Files\Vim\vim82\bundle'))
        
            
        if (dir1 || dir2)
                    
        "criando diretorios  problema ao criar diretorio e privilegio
                if dir1
                    :silent !mkdir "C:\Program Files\Vim\vim82\autoload"
                    "echo "~/autoload criado"
                endif
                    
                if dir2
                    :silent !mkdir "C:\Program Files\Vim\vim82\bundle"
                    "echo "~/bundle criado"
                endif
        

              silent exec 'cd' a:dw2
              "Option - 1) junegunn /vim-plug "
              silent exec "!curl -fLo ~/.vim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
            
              "Option - 2) Pathogen tope/pathogem "
              "silent exec "!curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim"
             
             "force redraw screen
              silent exec "redraw!"  
            
              "alterando diretorio corrente
              ""silent exec 'cd' a:dl2
              "download control-vim
              ""silent exec '!git clone https://github.com/brnfra/control-vim.git'
               
                         
                
                        
        endif	


	endfunction

	
endif
"------------------------------------End System config}}}"

"-------------------------------------------------------
"                   Global Stuff  {{{
"-------------------------------------------------------
""Set Inicial work-folder
if (has('win32') || has('win64'))
  :cd C:\Users\Bruno\Documents
endif

" ignore these files while expanding wild chars
"
set wildignore+=.svn,CVS,.git
set wildignore+=*.o,*.a,*.class,*.mo,*.la,*.so,*.lo,*.la,*.obj,*.pyc
set wildignore+=*.exe,*.zip,*.jpg,*.png,*.gif,*.jpeg,*pdf
set wildchar=<TAB>      " start wild expansion in the command line using <TAB>
set wildmenu
set linebreak
set foldcolumn=4
set foldclose=all
set foldmethod=marker
set nocompatible    " be iMproved, required  
set cul             " underline active line
""set number          " show number
""set ruler           " show ruler cursor
""set relativenumber  " show relative relative line number
syntax on           " Switch on syntax highlighting.
syntax enable
set showmode        " Show the current mode
set autowrite       " write buffers automagically when leaving them
set vb              " set visual bell -- 
setlocal wildmode=list:longest,full

"Word completion 
"Complementação de palavras
"set dictionary+=/usr/dict/words
"set complete=.,w,k
"set infercase
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=4       " Tabstops are 2 spaces
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent      " auto indent
set smarttab  " Be smart when using tabs ;)
set expandtab   " Use spaces instead of tabs
set si "Smart indent
set lbr
set tw=500  " Linebreak on 500 characters


"--------------------------------------------------------------------------- 
" ENCODING SETTINGS
"--------------------------------------------------------------------------- 
                            
set termencoding=utf-8

set fileencodings=ucs-bom,utf-8,gbk,big5,latin1

" By default, without wrapping
""set nowrap


set title
set titleold="Terminal"
set titlestring=%F

set gcr=a:blinkon0    "" Disable the blinking cursor.
set scrolloff=3
set modeline          "" Use modeline overrides
set modelines=10

set ch=2              " Make command line two lines high

set backspace=2       " Allow backspacing over indent, eol, and the start of an insert

set scrolloff=8       " When the page starts to scroll, keep the cursor 8 lines from the top and 8" lines from the bottom

set wildmenu          " Make the command-line completion better

"set diffopt+=iwhite   " Add ignorance of whitespace to diff

set hlsearch          " Enable search highlighting
set incsearch         " Incrementally match the search

set clipboard+=unnamedplus  " Add the unnamed register to the clipboard


set showfulltag       " When completing by tag, show the whole tag, not just the function name

" --- sane text files -------   Encoding ----" 
set encoding=utf-8
"set fileencoding=utf-8
"set fileencodings=utf-8             
set ttyfast


" sane editing
set tabstop=4
set shiftwidth=4
set softtabstop=4

" convert all typed tabs to spaces
set expandtab
"------------------------------------End Global stuffs}}}
"-------------------------------------------------------
    "     BEGIN PLUGINS INSTALL  {{{
"--------------------------------------------------------
"--AUTOCOMPLETION--
"filetype off                    "Vundle required


""execute pathogen#infect()

filetype plugin indent on
filetype plugin on
filetype indent on
""  SUMARY
""  Commands                            Description
""  PlugInstall [name ...] [#threads] 	Install plugins
""  PlugUpdate [name ...] [#threads] 	Install or update plugins
""  PlugClean[!] 	                    Remove unlisted plugins (bang version will clean without prompt)
""  PlugUpgrade 	                    Upgrade vim-plug itself
""  PlugStatus 	                        Check the status of plugins
""  PlugDiff 	                        Examine changes from the previous update and the pending changes
""  PlugSnapshot[!] [output path] 	    Generate script for restoring the current snapshot of the plugins
""  
""  Keybindings

"   D - PlugDiff
""  S - PlugStatus
""  R - Retry failed update or installation tasks
""  U - Update plugins in the selected range
""  q - Close the window
""  :PlugStatus
"       L - Load plugin
""  :PlugDiff
""      X - Revert the update
"
""https://github.com/junegunn/vim-plug
""" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
execute plug#begin()
call plug#begin('~/.vim/bundle')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'honza/vim-snippets'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'

" On-demand loading
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'


    "Nerdtree icons(require Nerd Fonts)"
Plug 'ryanoasis/vim-devicons'

Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'tpope/vim-markdown' 
Plug 'tpope/vim-sensible' 
Plug 'tpope/vim-surround'

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

" Multiple commands
Plug 'junegunn/vim-github-dashboard', { 'on': ['GHDashboard', 'GHActivity'] }

" Code to execute when the plugin is lazily loaded on demand
Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
autocmd! User goyo.vim echom 'Goyo is now loaded!'

" Multiple file types
Plug 'kovisoft/paredit', { 'for': ['clojure', 'scheme'] }

" On-demand loading on both conditions
Plug 'junegunn/vader.vim',  { 'on': 'Vader', 'for': 'vader' }

     "vim commentary
Plug 'tpope/vim-commentary'

   "vim air-line
Plug 'vim-airline/vim-airline' 
Plug 'vim-airline/vim-airline-themes'

   "colorschemes
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
  
Plug 'dense-analysis/ale'

"code indent"
Plug 'terryma/vim-multiple-cursors'
Plug 'Yggdroot/indentLine'

    "emmet tags html
Plug 'mattn/emmet-vim'
Plug 'hail2u/vim-css3-syntax'

      "greep
Plug 'mhinz/vim-grepper'

     "javascript
Plug 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax'
Plug 'jrue/Vimeo-jQuery-API'

let g:plug_url_format = 'git@github.com:%s.git'
    "Myplugin
Plug 'brnfra/mylivim'
unlet g:plug_url_format

" Initialize plugin system
call plug#end()



"-------------------------------------------------------
    "     END PLUGINS  }}}1
"--------------------------------------------------------
" assuming you want to use snipmate snippet engine
""ActivateAddons vim-snippets snipmate

""------------------------------------------------------
"             PLUGINS CONFIG {{{1
""------------------------------------------------------



if exists("*fugitive#statusline")
    set statusline+=%{fugitive#statusline()}
endif

""------------------------------------------------------
"             Netrw configuration       {{{2
""------------------------------------------------------
let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1

let shownetrw =0

if shownetrw

  let g:netrw_menu=1
  let g:netrw_preview=1
  let g:netrw_browse_split=2
  autocmd VimEnter * :Vexplore

endif
""-----------------------------------------END NETRW }}}2

"-------------------------------------------------------
"              NERDTree configuration      {{{2
""------------------------------------------------------

"p  -   parent directory
"s  -   vertical split
"i  -   horizontal split 
"u  -   up on folder tree
"t  -   open file in new tab
"r  -   refresh tree
"q  -   quit nerdtree
"z  -   z+[direction] move screen on nerdtree
"x  -   close tree root
"m  -   menu
    
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"let g:NERDTreeChDirMode=2
""let g:nerdtree_tabs_open_on_console_startup=0
""let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1

"let g:NERDTreeShowHidden=1
let g:NERDTreeWinSize = 40
""au VimEnter * NERDTree | wincmd p    " open NERDTree automatically, focus on file buffer
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite

"let g:NERDTreeDirArrowExpandable = '▸'
"let g:NERDTreeDirArrowCollapsible = '▾'
    
""	let g:NERDTreeDirArrowExpandable = '(+)'
""	let g:NERDTreeDirArrowCollapsible = '|-|'

"Disable arrows
let g:NERDTreeDirArrowExpandable = "\u00a0"
let g:NERDTreeDirArrowCollapsible = "\u00a0"

let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1

let g:NERDTreeMapUpdir = '<Left>'
let g:NERDTreeMapActivateNode = '<Right>'
let g:NERDTreeMapOpenSplit= '-'
let g:NERDTreeMapOpenVSplit= '+' 
nnoremap <F2> :NERDTreeTabsOpen<CR>
nnoremap <F3> :NERDTreeTabsClose<CR>


"---------------------------------END NERDTree }}}2
"
"               VIM-AIRLINE     {{{2
""--------------------------------------------------------
let g:airline_theme = 'base16'
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled = 1
"let g:airline#expansion#current_show
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#fugitiveline#enabled = 1
let g:airline_exclude_preview = 0

let g:airline_mode_map = {
      \ '__'     : '-',
      \ 'c'      : 'COMMAND',
      \ 'i'      : 'INSERT',
      \ 'ix'     : 'I',
      \ 'multi'  : 'MULTI',
      \ 'n'      : 'NORMAL',
      \ 'no'     : 'NORMAL',
      \ 'R'      : 'R',
      \ 'S'      : 'S',
      \ ''       : 'S',
      \ 't'      : 'T',
      \ 'V'      : 'VISUAL',
      \ 'v'      : 'VISUAL',
      \ '/'      : 'SEARCH',
      \ '^V'     : 'VISUAL BLOCK',   
      \  }

let g:airline_filetype_overrides = {
  \ 'defx':  ['defx', '%{b:defx.paths[0]}'],
  \ 'gundo': [ 'Gundo', '' ],
  \ 'help':  [ 'Help', '%f' ],
  \ 'minibufexpl': [ 'MiniBufExplorer', '' ],
  \ 'nerdtree': [ get(g:, 'NERDTreeStatusline', 'NERD'), '' ],
  \ 'startify': [ 'startify', '' ],
  \ 'vim-plug': [ 'Plugins', '' ],
  \ 'vimfiler': [ 'vimfiler', '%{vimfiler#get_status_string()}' ],
  \ 'vimshell': ['vimshell','%{vimshell#get_status_string()}'],
  \ }

if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif

 ""Set advanced status line
 ""status line
set statusline=\ %{HasPaste()}%<%-15.25(%f%)%m%r%h\ %w\ \ 
set statusline+=\ \ \ [%{&ff}/%Y] 
set statusline+=\ \ \ %<%20.30(%{hostname()}:%{CurDir()}%)\ 
set statusline+=%=%-10.(%l,%c%V%)\ %p%%/%L

let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline_right_alt_sep =''
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.dirty='⚡'
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''


    " --------------Status line
    "+---------------------------------------------------------------------------+
    "| A | B |                     C                          X | Y | Z |  [...] |
    "+---------------------------------------------------------------------------+

 ""let g:airline_section_a       (mode, crypt, paste, spell, iminsert)
  ""  let g:airline_section_a=%l
  ""let g:airline_section_b       (hunks, branch)[*]
  ""let g:airline_section_b = '%-0.10{getcwd()}'

  ""let g:airline_section_c       (bufferline or filename, readonly)
  ""let g:airline_section_c = '%f'

  ""let g:airline_section_gutter  (csv)
  ""let g:airline_section_x       (tagbar, filetype, virtualenv)
  ""  let g:airline_section_x +=FileType:      
  ""  let g:airline_section_x +=%y      

  ""let g:airline_section_y       (fileencoding, fileformat)
  ""let g:airline_section_z       (percentage, line number, column number)
  ""let g:airline_section_error   (ycm_error_count, syntastic-err, eclim,
  ""                               languageclient_error_count)
  ""let g:airline_section_warning (ycm_warning_count, syntastic-warn,
""                              languageclient_warning_count, whitespace)


 "" set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\
set laststatus=2      "" Status bar

fun! CurDir()
	let curdir = substitute(getcwd(), $HOME, "~", "")
	return curdir
endfun

fun! HasPaste()
	if &paste
		return '[PASTE]'
	else
		return ''
	endif
endfun


"------------------------------------END VIM-AIRLINE }}}2
"
"               INDENTLINE              {{{2
"-------------------------------------------------------

let g:indentLine_enabled = 0
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2
"let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_setColors = 0
let g:indentLine_char ='┊'
"let g:indentLine_color_term = 239
"let g:indentLine_color_gui = '#A4E57E' 
"let g:indentLine_color_dark = 1 "(default: 2) 
"let g:indentLine_bgcolor_term = 202 
"let g:indentLine_bgcolor_gui = '#FF5F00' 


"------------------------------------END INDENTLINE.VIM }}}2
"
"              COLORSCHEME {{{2
""------------------------------------------------------
"silent! colorscheme molokai
"silent! colorscheme visualstudio

if (has('win32') || has('win64'))
"let g:solarized_termcolors=256
endif

set background=dark
if has('unix')
    silent! colorscheme solarized
else
  silent!colorscheme base16-ateliercave
endif

if has('unix')
if has('gui_running')
    set background=light
else
    set background=dark
endif
endif

" Terminals that support italics
  let s:terms_italic=[
              \"rxvt",
              \"gnome-terminal"
              \]


  ""---------------------------------END COLORSCHEME }}}2

"                  MULTICURSOR.VIM {{{2
"-------------------------------------------------------
let g:multi_cursor_use_default_mapping=1
let g:multi_cursor_support_imap = 0
let g:multi_cursor_exit_from_visual_mode =1
let g:multi_cursor_exit_from_insert_mode =1
let g:multi_cursor_normal_maps =1
" Default mapping (visualmode / normal)
let g:multi_cursor_start_word_key      = '<C-m>'
let g:multi_cursor_select_all_word_key = '<A-m>'
let g:multi_cursor_start_key           = 'g<C-m>'
let g:multi_cursor_select_all_key      = 'g<A-m>'
let g:multi_cursor_next_key            = '<C-m>+'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<A-x>'
let g:multi_cursor_quit_key            = '<Esc>'

"For example, if you are using Neocomplete, add this to your vimrc to prevent conflict:

function! Multiple_cursors_before()
  if exists(':NeoCompleteLock')==2
    exe 'NeoCompleteLock'
  endif
endfunction

function! Multiple_cursors_after()
  if exists(':NeoCompleteUnlock')==2
    exe 'NeoCompleteUnlock'
  endif
endfunction

""---------------------------------END MULTICURSORS.VIM}}}2

"                 ALE.VIM  {{{2

"-------------------------------------------------------

set omnifunc=ale#completion#OmniFunc
let g:ale_completion_enabled = 1
let b:ale_fixers = {'html': ['prettier', 'eslint']}
"-----------------------------------END ALE.VIM}}}2

"-------------------------------------------------------
"                    TAGBAR     {{{2  
"-------------------------------------------------------


" -----------------------Tagbar Exuberant ctags
" --- TagBar
" toggle TagBar with F7 ;tb
"nnoremap <silent><F7> :TagbarToggle<CR> 
"nnoremap <leader>t :TagbarToggle<CR>
" set focus to TagBar when opening it
let g:tagbar_autofocus = 1
let g:TagbarOpenAutoClose = 1
let g:tagbar_autoclose = 1
" set default width of the Tagbar window
let g:tagbar_width = 30
" markdown support
let g:tagbar_type_markdown = {
        \ 'ctagstype': 'markdown',
        \ 'kinds': [ 'h:Heading_L1', 'i:Heading_L2', 'k:Heading_L3' ]
        \ }





"------------------------------------------------------}}}2

"-----------------------------------END PLUGINS CONFIG"}}}1
""-------------------------------------------------------

"                  AUTOCMD RULES {{{

"-------------------------------------------------------
"" The PC is fast enough, do syntax highlight syncing from start unless 200 lines

augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync maxlines=200
augroup END

"" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

"" txt
augroup vimrc-wrapping
  autocmd!
  "autocmd BufRead,BufNewFile *.txt call s:setupWrapping()
augroup END

"" make/cmake
augroup vimrc-make-cmake
  autocmd!
  autocmd FileType make setlocal noexpandtab
  autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake

augroup END
set autoread

augroup vimrc
    autocmd!
    autocmd BufWritePre * execute "normal ma"
    autocmd BufWritePre * exec "1," . 10 . "g/Arquivo\:.*/s//Arquivo\:".expand("%:t")
    autocmd BufWritePre * exec "1," . 10 . "g/Autor\:.*/s//Autor\: Bruno Franco"
    autocmd BufWritePre * exec "1," . 10 . "g/Ultima_modificacao\:.*/s//Ultima_modificacao\:".strftime("%c")
    autocmd BufWritePre * exec "1," . 10 . "g/Download\:.*/s//Download\: git\@github\.com\:brnfra"
    autocmd BufWritePost,FileWritePost * execute "normal `a"

augroup END
       
" Arquivos .sh sao sempre bash, e não sh
"au FileType sh let b:is_bash=1
set shell=$SHELL\ -f

"autocmd vimenter * NERDTree
autocmd VimEnter * exec ":loadview"
"-------------------------------------------END AUTCMD }}}

"                   SYNTAX Stuff        {{{

"-------------------------------------------------------
"let mapleader="," " Map <Leader> to ,

"au FileType php setl ofu=phpcomplete#CompletePHP
au FileType ruby,eruby setl ofu=rubycomplete#Complete
au FileType html,xhtml setl ofu=htmlcomplete#CompleteTags
au FileType c setl ofu=ccomplete#CompleteCpp
au FileType css setl ofu=csscomplete#CompleteCSS

" C/C++ specific settings
autocmd FileType c,cpp,cc  set cindent		

" Associate uncommon filetypes
au BufRead,BufNewFile Guardfile setfiletype ruby
au BufRead,BufNewFile *.module setfiletype php
au BufRead,BufNewFile *.install setfiletype php
au BufRead,BufNewFile *.md setfiletype markdown
au BufRead,BufNewFile .rspec setfiletype eruby
au BufRead,BufNewFile *.workflow setfiletype hcl
au BufRead,BufNewFile *.acl setfiletype vcl
au BufRead,BufNewFile *.txt setfiletype md

"---------------------------------------------
" file type detection
"---------------------------------------------
" highlight action script and mxml syntax
au BufNewFile,BufRead *.mxml set filetype=mxml
au BufNewFile,BufRead *.as set filetype=actionscript
au BufNewFile,BufRead *.less set filetype=less

"au BufWritePre * :%s/\s\+$//e        " remove trailing whitespace


"---------------------------------------------
" Enable omni completion. (Ctrl-X Ctrl-O)
"---------------------------------------------

autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType java set omnifunc=javacomplete#Complete
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
" use syntax complete if nothing else available
"autocmd FileType html,php,markdown,css,c,java,javascript,js,xml,phyton set foldmethod=indent 
if has("autocmd") && exists("+omnifunc")
	autocmd Filetype *
				\ if &omnifunc == "" |
				\   setlocal omnifunc=syntaxcomplete#Complete |
				\ endif
endif
set cot-=preview	"disable doc preview in omnicomplete


"---------------------------------------------
" for PHP programming
"---------------------------------------------
autocmd FileType php set makeprg=php\ -l\ %
autocmd FileType php set errorformat=%m\ in\ %f\ on\ line\ %l

"---------------------------------------------
" for edit CSS
"---------------------------------------------
autocmd FileType css setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
" make CSS omnicompletion work for SASS and SCSS
autocmd BufNewFile,BufRead *.scss			set ft=scss.css
autocmd BufNewFile,BufRead *.sass			set ft=sass.css

"---------------------------------------------
" for edit HTML
"---------------------------------------------
autocmd FileType html,xhtml setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4

"--------------------------------------------------------------------------- 
" Tip #382: Search for <cword> and replace with input() in all open buffers 
"--------------------------------------------------------------------------- 
" set leader to ;
let mapleader=";"
let g:mapleader=";"

fun! Replace() 
  let s:word = input("Replace " . expand('<cword>') . " with:") 
  :exe 'bufdo! %s/\<' . expand('<cword>') . '\>/' . s:word . '/ge' 
      :unlet! s:word 
    endfun 

"replace the current word in all opened buffers
noremap <leader>r :call Replace()<CR>

"-------------------------------------------END SYNTAX }}}
"-------------------------------------------------------
"                     COMPLETE MAPS     {{{
"-------------------------------------------------------

 " Ativa fechamento automático para parêntese
 " Set automatic expansion of parenthesis/brackets
 inoremap ( ()<left>
 inoremap { {}<left>
 inoremap [ []<left>
 inoremap ' ''<left>
 inoremap " ""<left>

" <F6> :setlocal spell! spelllang=pt_br<CR>
  noremap <F10> :q<cr>
  noremap <F9> :q!<cr>
  noremap <F8> :w<cr>:mkview<cr>
  inoremap <F8> <esc>:w<CR>:mkview<cr>   

if has ('unix')
        " Permite recarregar o vim para que modificações no
        " próprio vimrc seja ativadas com o mesmo sendo editado
        nnoremap 0v :<C-u>source ~/.vimrc <BAR> echo "Vimrc recarregado!"<CR>
        nnoremap 0V :<C-u>source ~/.vimrc <BAR> echo "Vimrc recarregado!"<CR>
        noremap ,v :source ~/.vimrc<CR>  " Para recarregar o .vimrc
        noremap ,V :source ~/.vimrc<CR>  " Para recarregar o .vimrc
        noremap +v :e ~/.vimrc<CR>  " para editar o .vimrc
        noremap +V :e ~/.vimrc<CR>  " para editar o .vimrc

  elseif (has('win32') || has('win64'))
      " Permite recarregar o vim para que modificações no
        " próprio vimrc seja ativadas com o mesmo sendo editado
        nnoremap 0v :<C-u>source ~\_vimrc <BAR> echo "Vimrc recarregado!"<CR>
        nnoremap 0V :<C-u>source ~\_vimrc <BAR> echo "Vimrc recarregado!"<CR>
        noremap ,v :source ~\_vimrc<CR>  " Para recarregar o .vimrc
        noremap ,V :source ~\_vimrc<CR>  " Para recarregar o .vimrc
        noremap +v :e ~\_vimrc<CR>  " para editar o .vimrc
        noremap +V :e ~\_vimrc<CR>  " para editar o .vimrc

endif

 "--------------------------------------------------------
 ""                 Abbreviations
 "--------------------------------------------------------
 "" this shortcuts will make improve type errors
 cnoreabbrev W! w!
 cnoreabbrev Q! q!
 cnoreabbrev Qall! qall!
 cnoreabbrev Wq wq
 cnoreabbrev Wa wa
 cnoreabbrev wQ wq
 cnoreabbrev WQ wq
 cnoreabbrev W w
 cnoreabbrev Q q
 cnoreabbrev Qall qall

 "  cut & paste to what they bloody ""shouldbe                                                                                                                              
"---------------------------------------------
"           copy to system buffer
"---------------------------------------------
if has('unix')
"Copy
""vnoremap <C-c> :w !xclip -i -selection clipboard<CR><CR>:w !xclip -o | ""y<cr><cr>
""vnoremap <C-c> ""y <Bar> :call system('xclip', ""y)<CR>
"" noremap <C-c> :w !xclip -i -selection clipboard<CR><CR>
vnoremap <leader>. ""y<CR>
"Cut 
vnoremap <leader>, ""x
"Paste
""inoremap <C-v> "*p<CR>
""inoremap <C-V> <esc>:r !xclip -o<CR>i
""inoremap  <esc>""p<CR>i
nnoremap p ""p<CR>
    

endif  


"---------------------------------------------
"                   EDITING
"---------------------------------------------
"repeate line bellow
inoremap <C-d> <esc>$v<Up>+yo<esc>pi

"indent"
"imap <C-[> :call reindent()
":function reindent() 
": if getpos(".")>0
":   <esc>0i<Del>
": endif
":endfunction 

noremap <F4> :Goyo 120x90%<CR>

noremap ,n :call Numshow()<CR>          " show number
function Numshow()
    let num = &number
    if !num
       set number
       set ruler
       set relativenumber
    else
       set nonumber
       set noruler
       set norelativenumber
    endif

endfunction
""noremap ,u :set ruler<CR>           " show ruler cursor
""noremap ,r :set relativenumber<CR>  " show relative relative line number


" inserir linhas e continuar em modo normal
noremap ,o o<ESC>:echo<CR>
noremap ,O O<ESC>:echo<CR>


" Mover linhas com: Ctrl+(seta abaixo) ou (seta acima)
" tem que estar em modo normal!
nnoremap <S-Down> <esc>ddp<esc>
nnoremap <S-Up> <esc>ddkP<esc>


" terminal emulation
nnoremap <silent> <leader>sh :terminal<CR>

" \ 'jump_to_def': '<C-]>',
"\ 'jump_to_def_split': '<C-W><C-]>',
" \ 'jump_to_def_vsplit': '<C-W><C-\>',
  

"" Switching windows buffer(NerdTree)
            
"" nnoremap <C-j> <C-w><Down>           "v
"" nnoremap <C-k> <C-w><Up>             "^
"" nnoremap <C-l> <C-w><Right><esc>     "->
"" nnoremap <C-h> <C-w><Left>           "<-


 nnoremap <C-Down> <C-w><Down>          "v
 nnoremap <C-Up> <C-w><Up>              "^
 nnoremap <C-Right> <C-w><Right><esc>   "->
 nnoremap <C-Left> <C-w><Left>          "<-


 "" Tabs
 nnoremap <Tab> gt
 nnoremap <S-Tab> gT
 nnoremap <S-t> :tabnew<CR>


"autocompletion document with ctrl+space
inoremap <c-space> <c-n>

"-------------------------------------------------------
"" Custom configs
"-------------------------------------------------------

" c
autocmd FileType c setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType cpp setlocal tabstop=4 shiftwidth=4 expandtab


" javascript
let g:javascript_enable_domhtmlcss = 1

" vim-javascript
augroup vimrc-javascript
  autocmd!
  autocmd FileType javascript setl tabstop=4|setl shiftwidth=4|setl expandtab softtabstop=4
augroup END


" jedi-vim
"<leader>    - ;

let g:jedi#auto_initialization = 1
let g:jedi#popup_on_dot = 0
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = "0"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#smart_auto_mappings = 0

"Syntax highlight
" Default highlight is better than polyglot
let g:polyglot_disabled = ['python']
let python_highlight_all = 1
"--------------------------------------------------------END MAPS  }}}
