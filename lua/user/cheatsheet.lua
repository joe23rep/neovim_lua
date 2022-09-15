require('cheatsheet').setup({
    telescope_mappings = {
        ['<CR>'] = require('cheatsheet.telescope.actions').select_or_execute,
        ['<A-CR>'] = require('cheatsheet.telescope.actions').select_or_fill_commandline,
    },
    bundled_cheatsheets = {
        -- only show the default cheatsheet
        enabled = { "default" },
    },
   })

