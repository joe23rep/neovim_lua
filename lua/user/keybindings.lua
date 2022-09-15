--  _  __            ____  _           _
-- | |/ /___ _   _  | __ )(_)_ __   __| |___
-- | ' // _ \ | | | |  _ \| | '_ \ / _` / __|
-- | . \  __/ |_| | | |_) | | | | | (_| \__ \
-- |_|\_\___|\__, | |____/|_|_| |_|\__,_|___/
--           |___/


local opts = { noremap = true, silent = true }
local opts2 = { noremap = true, silent = false }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
-- visual_block_mode = "x"
--   term_mode = "t",
--   command_mode = "c",

-----------------------------------------------------------------
-- Normal Mode
-----------------------------------------------------------------
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Move vertically by visual line
keymap("n", "j", "gj", opts)
keymap("n", "k", "gk", opts)

-- Tab / Shift Tab to switch buffers
keymap("n", "<S-Tab>", ":bp<CR>", opts)
keymap("n", "<Tab>", ":bn<CR>", opts)

-- Pressing enter now adds a line without going in insert mode
keymap("n", "<CR>", "o<ESC>", opts)

-- Map Ctrl S to safe
keymap("n", "<C-s>", ":up<CR>", opts2)

-- Map Ctrl q to safe and quit
keymap("n", "<C-q>", ":wq!<CR>", opts2)

-- Ctrl A to select all
keymap("n", "<C-a>", "ggVG", opts)

-- Press Space twice to enter insert mode
keymap("n", "<Space><Space>", "i", opts)

-- Map H+L to go to end or beginning of a line
keymap("n", "L", "$", opts)
keymap("n", "H", "^", opts)

-- Map J/K to jump between paragraphs
keymap("n", "J", "}", opts)
keymap("n", "K", "{", opts)

-- Map redo
keymap("n", "U", "<C-R>", opts)
keymap("n", "<C-z>", "<C-R>", opts)

-- Ctrl f to search
keymap("n", "<C-f", "/", opts2)

-- open init.lua
keymap("n", "ä", ":e ~/.config/nvim/init.lua<CR>", opts)

-----------------------------------------------------------------
-- Insert Mode
-----------------------------------------------------------------

-- Ctrl o to add one line down while staying in insert mode
keymap("i", "<C-o>", "<ESC>o", opts)

-- Map Ctrl S to safe
keymap("i", "<C-s>", "<ESC>:w<CR>", opts2)

-- Map Ctrl q to safe and quit
keymap("i", "<C-q>", "<ESC>:wq<CR>", opts2)

-- Map Ctrl+ vim keys to move normal in insert mode
keymap("i", "<C-l>", "<right>", opts)
keymap("i", "<C-h>", "<left>", opts)
keymap("i", "<C-k>", "<up>", opts)
keymap("i", "<C-j>", "<down>", opts)
keymap("i", "<C-L>", "<ESC>A", opts)
keymap("i", ">C-H>", "<ESC>H", opts)

----------------------------------------------------------------
-- Visual Mode
----------------------------------------------------------------

-- Better indenting
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Map J/K to jump between paragraphs
keymap("v", "J", "}", opts)
keymap("v", "K", "{", opts)

-- Stay in indent mode
keymap("v", "<", ">gv", opts)
keymap("v", ">", "<gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-----------------------------------------------------------------
-- Copy and Paste
-----------------------------------------------------------------

-- Copy and paste to system clipboard (requires gvim installed)
keymap("n", "<C-p>", "\"+P", opts2)
keymap("i", "<C-p>", "<ESC>\"+P}a", opts2)
keymap("n", "Y", "y$", opts2)
keymap("v", "<C-y>", "\"+y", opts2)
keymap("n", "<C-y>", "\"+y", opts2)
keymap("n", "<C-yy", "\"+yy", opts)
keymap("n", ",p", "\"0p", opts2)

-----------------------------------------------------------------
-- Escape mappings
-----------------------------------------------------------------

-- Press jk fast to exit insert mode
keymap("i", "jk", "<ESC>", opts)
keymap("v", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)
keymap("v", "kj", "<ESC>", opts)
keymap("i", "jj", "<ESC>", opts)
keymap("v", "jj", "<ESC>", opts)

-----------------------------------------------------------------
-- Leader mappings
-----------------------------------------------------------------

-- Map leader q to quit without saving
keymap("n", "<leader>q", ":qall!<CR>", opts)

-- save file as
keymap("n", "<leader>S", ":sav ", opts2)

--Buffers
keymap("n", "<leader>bc", ":bd<CR>", opts) -- Close buffer
keymap("n", "<leader>cb", ":bd<CR>", opts) -- Close buffer
keymap("n", "<leader>bn", ":enew<CR>", opts) -- Open new empty buffer
keymap("n", "<leader>s", ":luafile %<CR>", opts) -- Source current buffer
keymap('n', '<leader>bv', '<cmd>vnew<cr>', opts) -- open new buffer in v split

-- open v split
keymap("n", "<leader>v", ":vs<CR>", opts)

-- Root file interactions
keymap("n", "<leader>sw", ":SudoWrite<CR>", opts2)
keymap("n", "<leader>se", ":SudoEdit<CR>", opts2)

-- Replace word under cursor
keymap("n", "<leader>r", ":%s/<C-r><C-w>//g<Left><Left>", opts2)

-- Plug install shortcut
keymap("n", "<leader>pp", ":PackerSync<CR>", opts)

-- Telescope
keymap("n", "<leader>m", ":Telescope oldfiles<CR>", opts) -- open recent Files
-- TODO: change telescope find files starting dir
keymap("n", "<leader>h", ":Telescope help_tags<CR>", opts) -- show help pages
keymap("n", "<leader>f", ":Telescope find_files<CR>", opts) -- search all files
keymap("n", "<leader>F", ":Telescope live_grep<CR>", opts) --search for text
keymap("n", "<leader>nd", "[[:lua require'user.telescope'.dot_config()<CR>]]", opts) -- .config folder
keymap("n", "<leader>nc", "[[:lua require'user.telescope'.catppuccin()<CR>]]", opts) -- .ccatppuccin folder
keymap("n", "<leader>nn", "[[:lua require'user.telescope'.nvim_plugconfig()<CR>]]", opts) -- nvim plugin config files
keymap("n", "<leader>n", "[[:lua require'user.telescope'.find_configs()<CR>]]", opts) -- nvim config files
keymap("n", "<leader>ng", ":Telescope Glyph<CR>", opts) -- show font glyphs
keymap("n", "<leader>C", ":Cheatsheet<CR>", opts) -- show cheatcheet
keymap("n", "<leader>p", ":Telescope neoclip<CR>", opts) -- show cheatcheet

-- Treesitter Playground
keymap("n", "<leader>t", ":TSPlaygroundToggle<CR>", opts2)
keymap("n", "<leader>T", ":TSHighlightCapturesUnderCursor<CR>", opts2)

-- restore the last session
keymap("n", "<leader>ql", [[<cmd>lua require("persistence").load({ last = true })<cr>]], opts)

-- Vimwiki
keymap("n", "<leader>ww", ":VimwikiIndex<cr>", opts)
keymap("n", "<leader>wd", "<Plug>VimwikiDeleteFile", opts)
keymap("n", "<leader>wr", "<Plug>VimwikiRenameFile", opts)
keymap("n", "<leader>wt", "<Plug>VimwikiTabIndex", opts)
keymap("n", "<leader>ws", "<Plug>VimwikiUISelect", opts)

-- Colorizer
keymap("n", "<leader>c", ":ColorizerToggle", opts)

-- Rnvimr
keymap("n", "<leader>e", ":RnvimrToggle<CR>", opts)

-- CCC
keymap("n", "<leader>cc", ":CccPick<CR>", opts2)

-----------------------------------------------------------------
-- Plugin mappings
-----------------------------------------------------------------

-- Toggleterm
keymap("n", "<C-t>", ":ToggleTerm<CR>", opts)
keymap("i", "<C-t>", ":ToggleTerm<CR>", opts)
keymap("n", "<C-l>", ":lua _LAZYGIT_TOGGLE()<CR>", opts)

-- Comment
keymap("n", "cy", "yy<Plug>(comment_toggle_linewise)<cr>p", opts)

-- LSP
keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
keymap("n", "gR", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
keymap("n", "ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
keymap("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
keymap("n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts) --again in LSP/handlers
keymap("n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts) --again in LSP/handlers

-- Toggle
keymap("n", "+", ":call Toggle()<CR>", opts)
keymap("v", "+", ":call Toggle()<CR>", opts)

-----------------------------------------------------------------
-- Mouse mappings
-----------------------------------------------------------------
keymap("n", "<RightMouse>", "cc", opts)
keymap("n", "<2-RightMouse>", "yyccp", opts)


vim.cmd([[
" Stop showing Search highlights
nmap <silent><leader>z :let @/=""<CR>
]])

-- keymap("n", "", "", opts)
