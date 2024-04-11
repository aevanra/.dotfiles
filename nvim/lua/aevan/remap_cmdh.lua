vim.g.mapleader = " "
vim.keymap.set("n", "<leader>w", vim.cmd.w)
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

-- Git push
vim.keymap.set("n", "<leader>gp", "<cmd>!git push origin<cr>")

--Find and replace under cursor
vim.keymap.set("n", "<leader>fr", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- Buffer Management
vim.keymap.set('n', '<leader>bc', ":bd<CR>")
vim.keymap.set('n', '<leader>ca', ":%bd|e#|bd#<CR>")

-- Copilot Toggle
vim.keymap.set('n', '<leader>cpe', ":Copilot enable<CR>")
vim.keymap.set('n', '<leader>cpd', ":Copilot disable<CR>")

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
vim.keymap.set("n", ";d", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set("v", ";d", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- TSJ
vim.keymap.set("n", "<leader>tsj", "<CMD>TSJToggle<CR>", { desc = "Toggle Split/Join" })

-- Trouble
vim.keymap.set("n", "<leader>tr", "<CMD>TroubleToggle<CR>", { desc = "Toggle Trouble Buffer" })
