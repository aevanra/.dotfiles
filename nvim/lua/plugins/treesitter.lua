-- return {
--     {
--         'nvim-treesitter/nvim-treesitter',
--         build = ':TSUpdate',
--         lazy = false,
--         priority = 1000,
--         opts = {
--             -- A list of parser names, or "all" (the five listed parsers should always be installed)
--             ensure_installed = { "vimdoc", "python", "c", "lua", "vim", "vimdoc", "query" },
--
--             -- Install parsers synchronously (only applied to `ensure_installed`)
--             sync_install = false,
--
--             -- Automatically install missing parsers when entering buffer
--             -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
--             auto_install = true,
--
--             ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
--             -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!
--
--             highlight = {
--                 enable = true,
--                 additional_vim_regex_highlighting = false,
--             },
--         }
--     },
--     { 'nvim-treesitter/playground' },
--     {
--         "Wansmer/treesj",
--         opts = {
--             use_default_keymaps = false,
--             cursor_behavior = "hold",
--         }
--     },
-- }
--
--
return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        lazy = false,
        priority = 1000,
        opts = function(_, opts)
            -- Add fga to the list of installed parsers
            opts.ensure_installed = vim.tbl_extend("force", opts.ensure_installed or {}, { "fga" })

            -- Setup the custom parser for FGA
            local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
            parser_config.fga = {
                install_info = {
                    -- Change this path to where you've cloned the repo
                    url = "/home/aarmus/.local/share/tree-sitter-fga",
                    files = { "src/parser.c" },
                    generate_requires_npm = false,
                    requires_generate_from_grammar = false,
                },
                filetype = "fga",
            }

            return opts
        end,
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)

            -- Set .fga files to use the fga filetype
            vim.filetype.add({
                extension = {
                    fga = "fga",
                    dsl = "fga"
                },
            })
        end,
    },

    -- Playground for Treesitter inspection
    { 'nvim-treesitter/playground' },

    -- Treesj plugin
    {
        "Wansmer/treesj",
        opts = {
            use_default_keymaps = false,
            cursor_behavior = "hold",
        }
    },
}
