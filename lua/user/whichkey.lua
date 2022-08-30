local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local setup = {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 21, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  -- operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },
  window = {
    border = "rounded", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 1,
  },
  layout = {
    height = { min = 2, max = 25 }, -- min and max height of the columns
    width = { min = 11, max = 50 }, -- min and max width of the columns
    spacing = 8, -- spacing between columns
    align = "center", -- align columns left, center or right
  },
  ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = false, -- show help message on the command line when the popup is visible
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
  ["a"] = { ":Alpha<cr>", "Alpha" },
  ["e"] = { ":NvimTreeToggle<cr>", "Explorer" },
  ["f"] = { ":Telescope find_files<cr>", "Find files" },
  ["F"] = { ":Telescope live_grep<cr>", "Find Text" },
  ["h"] = { ":Telescope help_tags<cr>", "Help pages" },
  ["m"] = { ":Telescope oldfiles<cr>", "Open recent files" },
  ["q"] = { ":qall!<cr>", "Quit w/o saving" },
  ["s"] = { ":luafile %<cr>", "Source file", silent=false },
  ["S"] = { ":lua.require'persistence'.load({ last = true }]<cr>", "Load last session" },
  ["t"] = { ":TSPlaygroundToggle<cr>", "TS Playground" },
  ["T"] = { ":TSHighlightCapturesUnderCursor<cr>", "Colorgroup u/ cursor", silent=false },
  ["r"] = { ":%s/<C-r><C-w>//g<Left><Left>", "Replace word u/ cursor", silent=false },
  ["v"] = { ":vs<CR>","Open v split" },
  ["w"] = { ":SudoWrite<CR>","Edit as root", silent=false },
  ["z"] = { ":let @/=\"\"<CR>","Remove highlights"},

  p = {
    name = "Packer",
    c = { ":PackerCompile<cr>", "Compile" },
    i = { ":PackerInstall<cr>", "Install" },
    p = { ":PackerSync<cr>", "Sync" },
    s = { ":PackerStatus<cr>", "Status" },
    u = { ":PackerUpdate<cr>", "Update" },
  },

  c = {
      name = "Buffers",
      c = { ":enew<cr>", "New buffer" },
      b = { ":bd<cr>", "Close buffer" },
      n = { ":BufferLineCycleNext<cr>", "Move to next buffer" },
      p = { ":BufferLineCyclePrev<cr>", "Move to previous buffer" },
  },

  --q = {
  --   name = "Sessions",
  --   s = { "[[<cmd>lua require("persistence").load()<cr>]]", "load session for this file" },
  --   l = { "[[<cmd>lua require("persistence").load({ last = true })<cr>]]", "load last session" },
 --},

  g = {
    name = "Git",
    b = { ":Telescope git_branches<cr>", "Checkout branch" },
    c = { ":Telescope git_commit<cr>", "Checkout commits" },
    d = { ":Gitsigns diffthis HEAD<cr>", "Diff" },
    g = { ":lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
    j = { ":lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
    k = { ":lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
    l = { ":lua require 'gitsigns'.blame_line()<cr>", "Blame" },
    p = { ":lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
    r = { ":lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
    R = { ":lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
    u = { ":lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
    U = { ":lua require 'gitsigns'.undo_stage_hunk()<cr>", "Undo Stage Hunk" },
    s = { ":Telescope git_status<cr>", "Open changed file" },
  },

  l = {
    name = "LSP",
    a = { ":lua vim.lsp.buf.code_action()<cr>", "Code Action" },
    d = { ":Telescope lsp_document_diagnostics<cr>", "Document Diagnostics" },
    f = { ":lua vim.lsp.buf.format{async=true}<cr>", "Format" },
    i = { ":LspInfo<cr>", "Info" },
    I = { ":LspInstallInfo<cr>", "Installer Info" },
    j = { ":lua vim.lsp.diagnostic.goto_next()<CR>", "Next Diagnostic" },
    k = { ":lua vim.lsp.diagnostic.goto_prev()<cr>", "Prev Diagnostic" },
    l = { ":lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
    q = { ":lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
    r = { ":lua vim.lsp.buf.rename()<cr>", "Rename" },
    s = { ":Telescope lsp_document_symbols<cr>", "Document Symbols" },
    S = { ":Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols" },
    w = { ":Telescope lsp_workspace_diagnostics<cr>", "Workspace Diagnostics" },
  },

  n = {
    name = "Telescope",
    c = { ":lua require'user.telescope'.catppuccin()<CR>", "Open catppuccin folder" },
    d = { ":lua require'user.telescope'.dot_config()<CR>", "Open .config folder" },
    C = { ":Telescope commands<cr>", "Commands" },
    h = { ":Telescope help_tags<cr>", "Find Help" },
    n = { ":lua require'user.telescope'.nvim_plugconfig()<cr>", "Open nvim plugin folder" },
    k = { ":Telescope keymaps<cr>", "Keymaps" },
    r = { ":Telescope registers<cr>", "Registers" },
    s = { ":Telescope colorscheme<cr>", "Colorscheme" },
  },

  }

which_key.setup(setup)
which_key.register(mappings, opts)
