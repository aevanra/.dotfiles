return {
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
        dependencies = {
            -- LSP Support
            { "neovim/nvim-lspconfig" },
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },

            -- Autocompletion
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "L3MON4D3/LuaSnip" },
            { "saadparwaiz1/cmp_luasnip" },
            { "rafamadriz/friendly-snippets" },
        },
        config = function()
            local lsp_zero = require("lsp-zero")
            local cmp = require("cmp")
            local cmp_select = { behavior = cmp.SelectBehavior.Select }
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- Load friendly snippets
            require("luasnip.loaders.from_vscode").lazy_load()

            -- LSP Attach logic
            lsp_zero.on_attach(function(client, bufnr)
                local opts = { buffer = bufnr, remap = false }
            end)

            -- Setup Mason
            require("mason").setup({})
            require("mason-lspconfig").setup({
                handlers = {
                    lsp_zero.default_setup,
                    lua_ls = function()
                        local lua_opts = lsp_zero.nvim_lua_ls()
                        require("lspconfig").lua_ls.setup(lua_opts)
                    end,
                    ruff = function()
                        require("lspconfig").ruff.setup({
                            capabilities = capabilities,
                            settings = {
                                enable = true,
                                organizeImports = true,
                                fixAll = false,
                                lint = {
                                    enable = true,
                                    run = "onSave",
                                },
                            },
                        })
                    end,
                },
            })

            -- Setup CMP
            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                }, {
                    { name = "buffer" },
                }),
                capabilities = capabilities,
                formatting = lsp_zero.cmp_format(),
                mapping = cmp.mapping.preset.insert({
                    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-e>"] = cmp.mapping.close(),
                    ["<C-o>"] = cmp.mapping.complete(),
                    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
                    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
                    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
                    ["<C-Space>"] = cmp.mapping.complete(),
                }),
            })
        end,
    },

    -- LSP Formatting
    { "onsails/lspkind.nvim" },

    -- Command Completion
    { "smolck/command-completion.nvim" },

    -- Snippets
    { "L3MON4D3/LuaSnip" },

    -- Shellcheck
    { "itspriddle/vim-shellcheck" },
}


