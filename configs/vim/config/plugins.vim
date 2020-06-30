function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

call plug#begin('~/.config/nvim/plugged')
Plug 'liuchengxu/vim-clap'
let g:clap_cache_directory = $DATA_PATH . '/clap'
let g:clap_theme = 'material_design_dark'
let g:clap_layout = { 'relative': 'editor' }
let g:clap_enable_icon = 1
let g:clap_search_box_border_style = 'curve'
let g:clap_provider_grep_enable_icon = 1
let g:clap_prompt_format = '%spinner%%forerunner_status% %provider_id%: '
highlight! link ClapMatches Function
highlight! link ClapNoMatchesFound WarningMsg
  
Plug 'itchyny/vim-gitbranch'
Plug 'itchyny/vim-parenmatch'
Plug 'thinca/vim-localrc'
Plug 'romainl/vim-cool'
Plug 'sgur/vim-editorconfig'
Plug 'Shougo/context_filetype.vim'
Plug 'jaawerth/nrun.vim'
Plug 'justinmk/vim-gtfo'
Plug 'wellle/visual-split.vim'
Plug 'wellle/targets.vim'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-sleuth'

" Languages
Plug 'hail2u/vim-css3-syntax', {'for': 'css' }

Plug 'othree/csscomplete.vim', {'for': 'css' }
Plug 'cakebaker/scss-syntax.vim', {'for': [ 'scss', 'sass' ] }
Plug 'groenewege/vim-less', {'for': 'less'}
Plug 'iloginow/vim-stylus', {'for': 'stylus' }
Plug 'mustache/vim-mustache-handlebars', {'for': ['html', 'mustache', 'handlebars'] }

Plug 'digitaltoad/vim-pug', {'for': ['pug', 'jade'] }

Plug 'othree/html5.vim', {'for': 'html'}
let g:html5_event_handler_attributes_complete = 0
let g:html5_rdfa_attributes_complete = 0
let g:html5_microdata_attributes_complete = 0
let g:html5_aria_attributes_complete = 0

Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_strikethrough = 1
let g:vim_markdown_folding_level = 6
let g:vim_markdown_override_foldtext = 1
let g:vim_markdown_folding_style_pythonic = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_edit_url_in = 'vsplit'
let g:vim_markdown_auto_insert_bullets = 1
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_toc_autofit = 0
let g:vim_markdown_fenced_languages = [
  \ 'c++=cpp',
  \ 'viml=vim',
  \ 'bash=sh',
  \ 'ini=dosini',
  \ 'js=javascript',
  \ 'json=javascript',
  \ 'jsx=javascriptreact',
  \ 'tsx=typescriptreact',
  \ 'docker=Dockerfile',
  \ 'makefile=make',
  \ 'py=python'
  \ ]

Plug 'rhysd/vim-gfm-syntax',{'for': 'markdown'}
let g:gfm_syntax_enable_always = 0
let g:gfm_syntax_highlight_emoji = 0
let g:gfm_syntax_enable_filetypes = ['markdown']

" Javascript related
Plug 'pangloss/vim-javascript', {'for': ['javascript', 'javascriptreact']}
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1

Plug 'HerringtonDarkholme/yats.vim', {'for': ['typescript', 'typescriptreact']}

Plug 'MaxMEllon/vim-jsx-pretty', {'for': ['javascript', 'javascriptreact', 'typescriptreact']}
let g:vim_jsx_pretty_colorful_config = 1

Plug 'heavenshell/vim-jsdoc', {'for': ['javascript', 'javascriptreact']}
Plug 'jparise/vim-graphql', {'for': ['javascript', 'javascriptreact']}
Plug 'moll/vim-node', {'for': ['javascript', 'javascriptreact']}
Plug 'kchmck/vim-coffee-script', {'for': ['coffee', 'litcoffee']}
Plug 'elzr/vim-json', {'for': 'json'}
Plug 'posva/vim-vue', {'for': 'vue'}

Plug 'othree/yajs.vim', {'for': ['javascript', 'javascriptreact']}
Plug 'gavocanov/vim-js-indent', {'for': ['javascript', 'javascriptreact']}
Plug 'mxw/vim-jsx', {'for': ['javascript', 'javascriptreact']}
let g:jsx_ext_required = 0

" Golang related
Plug 'fatih/vim-go', {'for': ['go', 'gomod']}
let g:go_gopls_enabled = 0
let g:go_code_completion_enabled = 0
let g:go_doc_keywordprg_enabled = 0
let g:go_def_mapping_enabled = 0
let g:go_mod_fmt_autosave = 0
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_chan_whitespace_error = 0
let g:go_highlight_space_tab_error = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_types = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_operators = 1
let g:go_highlight_string_spellcheck = 0
let g:go_highlight_variable_declarations = 0
let g:go_highlight_variable_assignments = 0

" Python related
Plug 'vim-python/python-syntax', {'for': 'python'}
Plug 'Vimjas/vim-python-pep8-indent', {'for': 'python'}
Plug 'vim-scripts/python_match.vim', {'for': 'python'}
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}

" Misc
Plug 'StanAngeloff/php.vim', {'for': 'php'}

Plug 'tbastos/vim-lua', {'for': 'lua'}
Plug 'vim-ruby/vim-ruby', {'for': 'ruby'}
Plug 'keith/swift.vim', {'for': 'swift'}
Plug 'vim-jp/syntax-vim-ex', {'for': 'vim'}
Plug 'chrisbra/csv.vim', {'for': 'csv'}
Plug 'tpope/vim-git', {'for': ['git', 'gitrebase', 'gitconfig']}
Plug 'ekalinin/Dockerfile.vim', {'for': ['Dockerfile', 'docker-compose', 'gitconfig']}
Plug 'tmux-plugins/vim-tmux', {'for': 'tmux'}
Plug 'MTDL9/vim-log-highlighting', {'for': 'log'}
Plug 'lifepillar/pgsql.vim', {'for': 'pgsql'}
Plug 'chr4/nginx.vim', {'for': 'nginx'}
Plug 'towolf/vim-helm', {'for': 'helm'}

Plug 'pearofducks/ansible-vim', {'for': ['ansible', 'ansible_hosts', 'jinja2']}
let g:ansible_extra_keywords_highlight = 1
let g:ansible_template_syntaxes = {
  \   '*.json.j2': 'json',
  \   '*.(ba)?sh.j2': 'sh',
  \   '*.ya?ml.j2': 'yaml',
  \   '*.xml.j2': 'xml',
  \   '*.conf.j2': 'conf',
  \   '*.ini.j2': 'ini'
  \ }

Plug 'hashivim/vim-terraform', {'for': 'terraform', 'on': ['Terraform', 'TerraformFmt']}

" { repo: tyru/caw.vim, on_map: { nx: <Plug> }}
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }

Plug 'brooth/far.vim', {'on': ['Far', 'Farp', 'F']}
Plug 'mbbill/undotree', {'on': 'UndotreeToggle '}
Plug 'dstein64/vim-startuptime', {'on': 'StartupTime'}

Plug 'preservim/nerdtree', {'on': 'NERDTreeToggle'}

Plug 'tpope/vim-fugitive', {'on': [ 'G', 'Git', 'Gfetch', 'Gpush', 'Glog', 'Gclog', 'Gdiffsplit' ]}
augroup user_fugitive_plugin
  autocmd!
  autocmd FileType fugitiveblame normal A
augroup END

Plug 'junegunn/gv.vim', {'on': 'GV'}

Plug 'junegunn/fzf', { 'dir': '~/.fzf','do': './install --all', 'on': ['FZF', 'Files', 'GitFiles', 'Buffers', 'Lines', 'Ag', 'Rg', 'Locate' ]}
let g:fzf_layout = { 'down': '~25%' }
Plug 'junegunn/fzf.vim'

Plug 'Ron89/thesaurus_query.vim', {'on': ['Thesaurus', 'ThesaurusQueryReplaceCurrentWord', 'ThesaurusQueryLookupCurrentWord']}
let g:tq_map_keys = 0
let g:tq_use_vim_autocomplete = 0

" ==========================================
" Interface
" ---------
Plug 'rhysd/accelerated-jk'
Plug 'haya14busa/vim-edgemotion'

Plug 'dominikduda/vim_current_word'

Plug 'itchyny/vim-cursorword'
 augroup user_plugin_cursorword
   autocmd!
   autocmd FileType defx,denite,qf let b:cursorword = 0
   autocmd WinEnter * if &diff | let b:cursorword = 0 | endif
   autocmd InsertEnter * let b:cursorword = 0
   autocmd InsertLeave * let b:cursorword = 1
 augroup END

Plug 'airblade/vim-gitgutter'
let g:gitgutter_map_keys = 0
let g:gitgutter_sign_added = '▎'
let g:gitgutter_sign_modified = '▎'
let g:gitgutter_sign_removed = '▍'
let g:gitgutter_sign_removed_first_line = '▘'
let g:gitgutter_sign_modified_removed = '▍'
let g:gitgutter_preview_win_floating = 1
let g:gitgutter_sign_allow_clobber = 0
let g:gitgutter_sign_priority = 0
let g:gitgutter_override_sign_column_highlight = 0

Plug 'kshenoy/vim-signature'
let g:SignatureForceRemoveGlobal = 0
let g:SignatureUnconditionallyRecycleMarks = 1
let g:SignatureErrorIfNoAvailableMarks = 0
let g:SignaturePurgeConfirmation = 0
let g:SignatureMarkTextHLDynamic = 1
let g:SignatureMarkerTextHLDynamic = 1
let g:SignatureIncludeMarkers = repeat('⚐', 10)
autocmd user_events User GitGutter call signature#sign#Refresh()

Plug 'nathanaelkane/vim-indent-guides'
let g:indent_guides_default_mapping = 0
let g:indent_guides_tab_guides = 0
let g:indent_guides_color_change_percent = 3
let g:indent_guides_guide_size = 1
let g:indent_guides_exclude_filetypes = [
  \ 'help', 'denite', 'denite-filter', 'startify',
  \ 'vista', 'vista_kind', 'tagbar', 'nerdtree',
  \ 'lsp-hover', 'clap_input'
  \ ]

Plug 'junegunn/limelight.vim', {'on': 'Limelight'}


" ==========================================
" Completion and code analysis
" ----------
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
let g:asyncomplete_auto_completeopt = 0
source $VIM_PATH/config/plugins/asyncomplete.vim

Plug 'prabirshrestha/asyncomplete-lsp.vim'

Plug 'prabirshrestha/vim-lsp'
let g:lsp_diagnostics_enabled = 0
let g:lsp_virtual_text_enabled = 0
source $VIM_PATH/config/plugins/lsp-settings.vim

Plug 'mattn/vim-lsp-settings'
Plug 'Shougo/neco-vim'
Plug 'prabirshrestha/asyncomplete-necovim.vim'
autocmd User asyncomplete_setup call asyncomplete#register_source(
  \ asyncomplete#sources#necovim#get_source_options({
  \ 'name': 'necovim',
  \ 'whitelist': ['vim'],
  \ 'completor': function('asyncomplete#sources#necovim#completor'),
  \ }))

Plug 'prabirshrestha/asyncomplete-ultisnips.vim'
autocmd User asyncomplete_setup call asyncomplete#register_source(
  \ asyncomplete#sources#ultisnips#get_source_options({
  \ 'name': 'snip',
  \ 'priority': 0,
  \ 'whitelist': ['*'],
  \ 'blacklist': ['denite-filter', 'clap_input'],
  \ 'completor': function('asyncomplete#sources#ultisnips#completor'),
  \ }))

Plug 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger = '<C-l>'
let g:UltiSnipsListSnippets = ''
let g:UltiSnipsJumpForwardTrigger = '<C-f>'
let g:UltiSnipsJumpBackwardTrigger = '<C-b>'


Plug 'honza/vim-snippets', Cond(has('python3'))

Plug 'dense-analysis/ale'
let g:ale_disable_lsp = 0
let g:ale_echo_delay = 100
let g:ale_lint_delay = 1000
let g:ale_echo_msg_format = 'ale %linter%: %code: %%s [%severity%]'
let g:ale_history_enabled = 0
let g:ale_sign_error = '✖'
let g:ale_sign_warning = 'ⁱ'
let g:ale_maximum_file_size = 500000

Plug 'mattn/emmet-vim', {'for': [ 'html', 'css', 'javascript', 'javascriptreact' ]}
let g:user_emmet_complete_tag = 0
let g:user_emmet_install_global = 0
let g:user_emmet_install_command = 0
let g:user_emmet_mode = 'i'

Plug 'Raimondi/delimitMate'
let g:delimitMate_expand_cr = 0
let g:delimitMate_expand_space = 1
let g:delimitMate_smart_quotes = 1
let g:delimitMate_expand_inside_quotes = 0
let g:delimitMate_excluded_ft = 'mail,txt'
augroup user_plugin_delimitMate
  au!
  au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
  au FileType tex let b:delimitMate_quotes = ""
  au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
  au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END

" ==========================================
" Operators
" ---------
Plug 'kana/vim-operator-user'
Plug 'kana/vim-operator-replace'
Plug 'machakann/vim-sandwich'
let g:sandwich_no_default_key_mappings = 1
let g:operator_sandwich_no_default_key_mappings = 1
let g:textobj_sandwich_no_default_key_mappings = 1


" ==========================================
" Text objects
" ------------
Plug 'kana/vim-textobj-user'
Plug 'terryma/vim-expand-region'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'osyo-manga/vim-textobj-multiblock'
let g:textobj_multiblock_no_default_key_mappings = 1

Plug 'kana/vim-textobj-function'
let g:textobj_function_no_default_key_mappings = 1

call plug#end()

"arretons de nous complaire dans la contemplation de ce qu on considere etre responsable du probleme. et commencer a se considerer comme acteur de la solution. 
" ca ne sert a rien d avoir le courage de tout. sauf de conclure.
" Conclure c'est presenter des etapes simples, concrete, realisable. Que l'on puisse mettre sur pieds dès la fin
" de notre discours. 


" vim: set ts=2 sw=2 tw=80 noet :
