require('Comment').setup(
{
    ---Add a space b/w comment and the line
    padding = true,
    ---Whether the cursor should stay at its position
    sticky = true,
    ---Lines to be ignored while (un)comment
    ignore = nil,
    ---LHS of toggle mappings in NORMAL mode
    toggler = {
        ---Line-comment toggle keymap
        line = 'cc',
        ---Block-comment toggle keymap
        block = 'CC',
    },
    ---LHS of operator-pending mappings in NORMAL and VISUAL mode
    opleader = {
        ---Line-comment keymap
        line = 'cc',
        ---Block-comment keymap
        block = 'CC',
    },
    ---LHS of extra mappings
    extra = {
        ---Add comment on the line above
        above = 'ccO',
        ---Add comment on the line below
        below = 'cco',
        ---Add comment at the end of line
        eol = 'ccA',
    },
    ---Enable keybindings
    ---NOTE: If given `false` then the plugin won't create any mappings
    mappings = {
        ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
        basic = true,
        ---Extra mapping; `gco`, `gcO`, `gcA`
        extra = true,
        ---Extended mapping; `g>` `g<` `g>[count]{motion}` `g<[count]{motion}`
        extended = false,
    },
    ---Function to call before (un)comment
    pre_hook = nil,
    ---Function to call after (un)comment
    post_hook = nil,

}
)


