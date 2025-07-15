vim.g.mapleader = " "
vim.keymap.set("n", "<leader>w", vim.cmd.w)
vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("n", "<leader>wf", "<cmd>w!<cr>")
vim.keymap.set("n", "<leader>q", vim.cmd.q)
vim.keymap.set("n", "<leader>qf", "<cmd>q!<cr>")
vim.keymap.set("n", "<leader>qa", "<cmd>qall<cr>")
vim.keymap.set("n", "<leader>qaf", "<cmd>qall!<cr>")
vim.keymap.set("n", "<leader>wq", vim.cmd.wq)
vim.keymap.set("n", "<leader>wqf", "<cmd>wq!<cr>")
vim.keymap.set("n", "<leader><Enter>", "i<Enter><Esc>")

--Notification Management
vim.keymap.set("n", "<leader>nn", function() require('noice').cmd("dismiss") end)
vim.keymap.set("n", "<leader>nh", function() require('noice').cmd("telescope") end)

-- Python formatting
vim.keymap.set("n", "<leader>rf", "<cmd>!ruff check --fix %:p <cr>")
vim.keymap.set("n", "<leader>fmt", "<cmd>!black %:p <cr>")

-- Save and run python file
vim.keymap.set('n', '<leader>py', ":update<bar>!python %<CR>")

-- Git Management
vim.keymap.set("n", "<leader>gp", "<cmd>!git push origin<cr>")
vim.keymap.set('n', '<leader>gs', vim.cmd.Git)
vim.keymap.set("n", "<leader>gst", ":Gitsigns toggle_signs<CR>")
vim.keymap.set("n", "<leader>gdf", ":Gitsigns diffthis<CR>")
vim.keymap.set("n", "<leader>gdp", ":Gitsigns preview_hunk<CR>")
vim.keymap.set("n", "<leader>gdcc", ":Gitsigns dump_cache<CR>")

-- Supermaven Toggle
vim.keymap.set("n", "<leader>smt", ":SupermavenToggle<CR>")

--Find and replace under cursor
vim.keymap.set("n", "<leader>fr", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- Buffer Management
vim.keymap.set('n', '<leader>bc', ":bd<CR>")
vim.keymap.set('n', '<leader>ca', ":%bd|e#|bd#<CR>")

-- Window Creation
vim.keymap.set('n', '<leader>nw', '<C-w>v')
vim.keymap.set('n', '<leader>nwb', '<C-w>s')

-- Window Movement
vim.keymap.set('n', '<leader>m', '<C-w>h')
vim.keymap.set('n', '<leader>n', '<C-w>j')
vim.keymap.set('n', '<leader>e', '<C-w>k')
vim.keymap.set('n', '<leader>i', '<C-w>l')
vim.keymap.set('n', '<leader><Left>', '<C-w>h')
vim.keymap.set('n', '<leader><Down>', '<C-w>j')
vim.keymap.set('n', '<leader><Up>', '<C-w>k')
vim.keymap.set('n', '<leader><Right>', '<C-w>l')

-- Window Resizing
vim.keymap.set('n', '<C-i>', '<C-w>>') -- increase width
vim.keymap.set('n', '<C-e>', '<C-w>+') -- increase height 
vim.keymap.set('n', '<C-n>', '<C-w>-') -- decrease height
vim.keymap.set('n', '<C-m>', '<C-w><') -- decrease width

--LSP Refresh
vim.keymap.set('n', '<leader>lsp', ':LspRestart<CR>')

-- DAP
vim.keymap.set('n', '<leader>dc', ':lua require"dap".continue()<CR>')
vim.keymap.set('n', '<leader>dr', ':lua require"dap".restart()<CR>')
vim.keymap.set('n', '<leader>dt', ':lua require"dap".terminate()<CR>')
vim.keymap.set('n', '<leader>bp', ':lua require"dap".toggle_breakpoint()<CR>')
vim.keymap.set('n', '<leader>si', ':lua require"dap".step_into()<CR>')
vim.keymap.set('n', '<leader>so', ':lua require"dap".step_over()<CR>')
vim.keymap.set('n', '<leader>st', ':lua require"dap".repl.open()<CR>')
vim.keymap.set('n', '<leader>cb', ':lua require"dap".clear_breakpoints()<CR>')

-- Harpoon
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<leader>f", ui.toggle_quick_menu)
vim.keymap.set("n", "<leader>j", function() ui.nav_next() end)
vim.keymap.set("n", "<leader>b", function() ui.nav_prev() end)

--Oil Navigation
vim.keymap.set("n", "<leader>;d", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set("v", "<leader>;d", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- TSJ
vim.keymap.set("n", "<leader>tsj", "<CMD>TSJToggle<CR>", { desc = "Toggle Split/Join" })

-- Trouble
vim.keymap.set("n", "<leader>tr", "<CMD>Trouble diagnostics toggle<CR>", { desc = "Toggle Trouble Buffer" })
vim.keymap.set("n", "<leader>cl", "<CMD>Trouble lsp toggle focus<CR>", { desc = "Toggle Trouble Buffer" })

-- DBUI
vim.keymap.set("n", "<leader>db", "<CMD>DBUIToggle<CR>", { desc = "Toggle DBUI" })

-- DBT Stuff
vim.api.nvim_create_autocmd("Filetype",{
    pattern = {"sql"},
    callback = function()
        vim.schedule(function()
            vim.keymap.set("n", "<leader>gd", "<CMD>DBTGoToDefinition<CR>", { desc = "Go to definition DBT" })
        end)
    end,
})


-- LSP Keybinds
local opts = {remap = false}
vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n','<C-p>',builtin.git_files, {})
vim.keymap.set('n', '<leader>fs', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

-- undotree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- tabs
vim.keymap.set("n", "<leader>1", "<CMD>BufferGoto 1<CR>")
vim.keymap.set("n", "<leader>2", "<CMD>BufferGoto 2<CR>")
vim.keymap.set("n", "<leader>3", "<CMD>BufferGoto 3<CR>")
vim.keymap.set("n", "<leader>4", "<CMD>BufferGoto 4<CR>")
vim.keymap.set("n", "<leader>5", "<CMD>BufferGoto 5<CR>")
vim.keymap.set("n", "<leader>6", "<CMD>BufferGoto 6<CR>")
vim.keymap.set("n", "<leader>7", "<CMD>BufferGoto 7<CR>")
vim.keymap.set("n", "<leader>8", "<CMD>BufferGoto 8<CR>")
vim.keymap.set("n", "<leader>9", "<CMD>BufferGoto 9<CR>")
vim.keymap.set("n", "<leader>0", "<CMD>BufferLast<CR>")

