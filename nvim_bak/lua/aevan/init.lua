-- require("aevan/remap")
require("aevan/remap_cmdh")
require("aevan/set")
require('command-completion').setup()

vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        vim.cmd("Copilot disable")
    end,
})
