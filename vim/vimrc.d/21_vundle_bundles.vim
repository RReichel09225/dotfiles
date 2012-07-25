" List of Vundle bundles
" Call :BundleInstall to install bundles after adding to this file.
" Delete the downloaded bundle folder to uninstall a bundle.

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" Adds a bundles menu, revealing your bundles/plugins and the features
" they provide.
" README at https://github.com/mbadran/headlights
" Requires vim with python support (vim --version | grep "+python")
"Bundle 'mbadran/headlights'

" A clone of TextMate's twilight colorscheme
Bundle 'matthewtodd/vim-twilight'

" Provides functionality needed by other bundles.
Bundle 'L9'

" FuzzyFinder provides convenient ways to quickly reach the
" buffer/file/command/bookmark/tag you want. FuzzyFinder searches with the
" fuzzy/partial pattern to which it converted an entered pattern.
" README at https://github.com/vim-scripts/FuzzyFinder
Bundle 'FuzzyFinder'

" A tree explorer plugin for vim
" README at https://github.com/scrooloose/nerdtree/
Bundle 'scrooloose/nerdtree'

" NERDTree and tabs together in Vim, painlessly.
" README at https://github.com/jistr/vim-nerdtree-tabs/
Bundle 'jistr/vim-nerdtree-tabs'

" A syntax checking plugin that runs files through external syntax checkers
" and displays any resulting errors to the user. This can be done on demand,
" or automatically as files are saved.
" README at https://github.com/scrooloose/syntastic
Bundle 'scrooloose/syntastic'

" Git wrapper so awesome, it should be illegal
" README at https://github.com/tpope/vim-fugitive/
Bundle 'tpope/vim-fugitive'

" Motions made easy: <Leader><Leader>{text-object} to hightlight the possible
" targets, e.g.:
" ,,w for the following words,
" ,,Fa for the previous 'a',
" README at https://github.com/Lokaltog/vim-easymotion/
Bundle 'Lokaltog/vim-easymotion'

" The ultimate vim statusline utility.
" README at https://github.com/Lokaltog/vim-powerline/
Bundle 'Lokaltog/vim-powerline'

" Makes it easy to zoom into and out of a window
Bundle 'ZoomWin'

" Matlab bundles
Bundle 'sgeb/vim-matlab'
Bundle 'djoshea/vim-matlab-fold'

" Perform all your vim insert mode completions with <tab>
" README at https://github.com/ervandew/supertab/
Bundle 'ervandew/supertab'

" Allows you to run interactive programs inside vim.
" README at https://github.com/vim-scripts/Conque-Shell
" Requires vim with python support (vim --version | grep "+python")
"Bundle 'Conque-Shell'

" Text-object motion for CamelCaseWords
" <cmd>i,w
Bundle 'bkad/CamelCaseMotion'

" Text-object motion for functions arguments
" <cmd>ia and <cmd>aa
Bundle 'argtextobj.vim'

" Text-object motion for indentations (Python, Coffeescript, ...)
" <cmd>ii and <cmd>ai
Bundle 'michaeljsmith/vim-indent-object'

" Text-object motion for surroundings: parentheses, brackets, quotes, XML tags
" README at https://github.com/tpope/vim-surround/
Bundle 'tpope/vim-surround'

" use ctrl-A/ctrl-X to increment/decrement dates and times
" default only works on integers
" README at http://www.vim.org/scripts/script.php?script_id=2120
Bundle 'tpope/vim-speeddating'

" \\\ to toggle-comment whole line, \\ for target of a motion (\\ap to
" toggle-comment a paragraph) and \\ in visual mode to toggle-comment selection.
" \\u uncomments a set of adjacent commented lines.
Bundle 'tpope/vim-commentary'

" handy mappings that come in a pair: move to next/prev buffer ([b, ]b),
" add a newline before/after current line ([<space>, ]<space>),
" swap line with prev/next ([e, ]e), XML encode/decode ([x, ]x),
" URL encode/decode ([u, ]u), C string style encode/decode ([y, ]y),
" base65 encode/decode ([Y, ]Y) and much more.
" README at
" https://github.com/tpope/vim-unimpaired/blob/master/doc/unimpaired.txt
Bundle 'tpope/vim-unimpaired'

" Enable repeating supported plugin maps with "."
Bundle 'tpope/vim-repeat'

" Maintains a history of previous yanks, changes and deletes
Bundle 'YankRing.vim'

" Easily search for, substitute, and abbreviate multiple variants of a word
"Bundle 'tpope/vim-abolish'

" Lets you write HTML code faster
" README at https://github.com/rstacruz/sparkup/
"Bundle 'rstacruz/sparkup'

" The Command-T plug-in provides an extremely fast, intuitive mechanism for
" opening files and buffers with a minimal number of keystrokes.
" README at https://github.com/wincent/Command-T
" Requires vim with ruby support (vim --version | grep "+ruby")
Bundle 'wincent/Command-T'
