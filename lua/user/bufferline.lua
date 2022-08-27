vim.opt.termguicolors = true
require("bufferline").setup{
    highlights = {
            modified = {
                fg = '#ff8d01',
                bg = '#1d263c',
            },
            modified_selected = {
                fg = '#ff8d01',
                bg = '#101221'
            },
            modified_visible = {
                fg = '#ff8d01' ,
                bg = '#1d263c'
            },
    },
    options = {
        left_trunc_marker = '',
        right_trunc_marker = '',
        modified_icon = '',
        max_name_length = 18,
        tab_size = 20,
        diagnostics = false,
        color_icons = false,
        show_buffer_icons = false,
        show_tab_indicators = true,
        separator_style = "padded_slant",
        show_buffer_default_icon = false,
        show_modified_icon = false,
        always_show_bufferline = true,
        offsets = {
            {
              filetype = "NvimTree",
              text = "File Explorer",
              highlight = "Directory",
              text_align = "left"
            }
          }
      }
}
vim.cmd([[
"hl.close_button_selected = 
"hl.close_button = 
"hl.modified = 
"autocmd ColorScheme * highlight modified guifg=none  guibg=none
]])


