return {
    {
        'echasnovski/mini.comment',
        branch = 'stable',
        opts = {}
    },
    {
        'echasnovski/mini.pairs',
        branch = 'stable',
        opts = {
            mappings = {
                ['('] = { action = 'open', pair = '()', neigh_pattern = '[^\\].' },
                ['['] = { action = 'open', pair = '[]', neigh_pattern = '[^\\].' },
                ['{'] = { action = 'open', pair = '{}', neigh_pattern = '[^\\].' },

                [')'] = { action = 'close', pair = '()', neigh_pattern = '[^\\].' },
                [']'] = { action = 'close', pair = '[]', neigh_pattern = '[^\\].' },
                ['}'] = { action = 'close', pair = '{}', neigh_pattern = '[^\\].' },

                ['"'] = { action = 'closeopen', pair = '""', neigh_pattern = '[^\\].', register = { cr = false } },
                ["'"] = { action = 'closeopen', pair = "''", neigh_pattern = '[^%a\\].', register = { cr = false } },
                ['`'] = { action = 'closeopen', pair = '``', neigh_pattern = '[^\\].', register = { cr = false } },

                ['%'] = { action = 'open', pair = '%%', neigh_pattern = '{'},
                ['#'] = { action = 'open', pair = '##', neigh_pattern = '{'},

            }
        }
    },
    {
        'echasnovski/mini.surround',
        branch = 'stable',
        opts = {
            mappings = {
                add = '<leader>sa', -- Add surrounding in Normal and Visual modes
                delete = '<leader>sd', -- Delete surrounding
                find = '<leader>sf', -- Find surrounding (to the right)
                find_left = '<leader>sF', -- Find surrounding (to the left)
                highlight = '<leader>sh', -- Highlight surrounding
                replace = '<leader>sr', -- Replace surrounding
                update_n_lines = '<leader>sn', -- Update `n_lines`

                suffix_last = '<leader>l', -- Suffix to search with "prev" method
                suffix_next = '<leader>n', -- Suffix to search with "next" method
            },
        }
    },
}
