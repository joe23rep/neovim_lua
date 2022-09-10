local options = {

  backup = false,                          -- creates a backup file
  clipboard = "unnamed",                   -- allows neovim to access the system clipboard
  cmdheight = 1,                           -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  ttyfast = true,                          -- Speed up scrolling in Nvim
  conceallevel = 0,                        -- so that `` is visible in markdown files
  hlsearch = true,                         -- highlight all matches on previous search pattern
  ignorecase = true,                       -- ignore case in search patterns
  mouse = "a",                             -- allow the mouse to be used in neovim
  pumheight = 10,                          -- pop up menu height
  showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
  showtabline = 2,                         -- always show tabs
  smartcase = true,                        -- smart case
  textwidth = 110,
  smartindent = true,                      -- make indenting smarter again
  splitbelow = false,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
  swapfile = false,                        -- creates a swapfile
  termguicolors = true,                    -- set term gui colors (most terminals support this)
  undofile = true,                         -- enable persistent undo
  updatetime = 300,                        -- faster completion (4000ms default)
  writebackup = false,
  expandtab = true,                        -- convert tabs to spaces
  timeoutlen= 500,                           -- Remove the pause when leaving insert mode
  shiftwidth = 2,                          -- the number of spaces inserted for each indentation
  tabstop = 2,                             -- insert 2 spaces for a tab
  cursorline = false,                      -- highlight the current line
  number = true,                           -- set numbered lines
  relativenumber = true,                   -- set relative numbered lines
  numberwidth = 4,                         -- set number column width to 2 {default 4}
  signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
  wrap = true,                             -- display lines as one long line
  scrolloff = 8,                           -- is one of my fav
  sidescrolloff = 8,
  guifont = "FiraCode Nerd Font:h8",      -- the font used in graphical neovim applications
  confirm = true,                          -- asks to confirm if you want to leave and a changed file hasnt been saved yet
  copyindent = true,                       -- keeps the indentation of the copied lines
  linebreak = true,                        -- will break words at the last possible word not last possible letter
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- remove trailing whitespaces
vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
  pattern = { '*' },
  callback = function()
    vim.api.nvim_command [[%s/\s\+$//e]]
  end
})


vim.cmd([[
  set whichwrap+=<,>,[,],h,l
  set iskeyword+=-
  set formatoptions-=cro]
  "set ttymouse=sgr

  " Search down into subfolders
  set path+=**

  " remove whitespaces on save
  let g:incsearch#auto_nohlsearch = 1

  " F1 should now be remapable
  set <F1>=<C-v><F1>

  " Open help pages in fullwindow
  command! -nargs=1 -complete=help H help <args> | silent only

  " Add cursorline when entering insert mode
  "au InsertEnter * set cul
  "au InsertLeave * set nocul

  " Make sure vim returns to the line u closed the document on
  if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
                \| exe "normal! g'\"" | endif
  endif

  " Visual select mode move lines
  function! s:Visual()
    return visualmode() == 'V'
  endfunction

  function! Move_up() abort range
    let l:at_top=a:firstline ==1
    if s:Visual() && !l:at_top
        '<,'>move '<-2
        call feedkeys('gv=', 'n')
    endif
    call feedkeys('gv', 'n')
  endfunction

  function! Move_down() abort range
    let l:at_bottom=a:lastline == line ('$')
    if s:Visual() && !l:at_bottom
        '<,'>move '>+1
        call feedkeys('gv=', 'n')
    endif
    call feedkeys('gv', 'n')
  endfunction

  " Hide last command after 10 seconds
  function! s:empty_message(timer)
    echo ''
  endfunction

  augroup cmdline
    autocmd!
    autocmd CmdlineLeave : call timer_start(10000, funcref('s:empty_message'))
  augroup END

  " Automatically remove whitespaces on save
  autocmd BufWritePre * %s/\s\+$//e

  " Enable saving Folds
  augroup AutoSaveFolds
    autocmd!
    autocmd BufWinLeave,BufLeave,BufWritePost ?* nested silent! mkview!
    autocmd BufWinEnter ?* silent! loadview
  augroup end

  " Enable saving as root
  command W :execute ':silent w !sudo tee % > /dev/null' | :edit!
]])








