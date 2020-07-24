"  creation of global mark will trigger creation of IDE's bookmark
"  and vice versa."
set ideamarks
" set relativenumber
set incsearch
set gdedault
set smartcase
set ignorecasse
set clipboard+=unnamed
set ideajoin
set easymotion
set surround
set multiple-cursors
set commentary
set argtextobj
set exchange
set textobj-entire

let mapleader=" "
let maplocalleader=","

nnoremap <leader>j :join<CR>

" key bindings for quickly moving between windows
xmap <C-h> <c-w>h
xmap <C-l> <c-w>l
xmap <C-k> <c-w>k
xmap <C-j> <c-w>j

nmap <leader>t :action ActivateTerminalToolWindow<CR>

" Navigation
nmap <leader>h :action Back<cr>
nmap <leader>l :action Forward<cr>
nmap <leader>L :action RecentLocations<cr>
nmap <leader>g :action GotoDeclaration<cr>
nmap <leader>u :action FindUsages<cr>
nmap <leader>f :action GotoFile<cr>
nmap <leader>c :action GotoClass<cr>
nmap <leader>s :action GotoSymbol<cr>
" nmap <leader>m :action FileStructurePopup<cr>
nmap <leader>; :action FileStructurePopup<cr>
nmap <leader>M :action ActivateStructureToolWindow<cr>
nmap <leader>d :action ShowErrorDescription<cr>
nmap <leader>i :action GotoImplementation<cr>
nmap <leader>I :action SelectIn<cr>
nmap <leader>e :action RecentFiles<cr>
nmap <leader>t :action GotoTest<cr>
nmap <leader>p :action JumpToLastWindow<cr>
nmap <leader>b :action ShowBookmarks<cr>

" Tools use localleader
" gX : open git related window
" branch gbx : git do x on branch
nmap ,ga :action Git.Add<cr>
nmap ,gm :action Git.Merge<cr>
nmap ,gs :action Git.Stash<cr>
nmap ,gus :action Git.Unstash<cr>

nmap ,gbr :action Git.Branches<cr>
nmap ,gbc :action Git.CompareWithBranch<cr>
nmap ,gbn :action Git.CreateNewBranch<cr>

nmap ,gL :action Git.Log.Toolbar<cr>

nmap ,gM :action Git.Menu<cr>
nmap ,gC :action Git.ContextMenu<cr>

nmap ,gR :action Git.RepositoryActions<cr>

