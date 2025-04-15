return {
    {
        "stevearc/oil.nvim",
        lazy = false,
        opts = { 
            view_options = {
                show_hidden = true,
                is_hidden_file = function(name, bufnr)
                    return vim.startswith(name, ".")
                end,
                is_always_hidden = function(name, bufnr)
                    return false
                end,
                natural_order = true,
                sort = {
                    { "type", "asc" },
                    { "name", "asc" },
                },
            }, 
        }
    },
}
