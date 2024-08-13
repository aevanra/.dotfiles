local cmp = require "cmp"
cmp.setup()

cmp.setup.filetype({ "sql" },
{
    sources = {
        { name = "vim-dadbod-completion" },
        { name = "buffer" },
    },
})
