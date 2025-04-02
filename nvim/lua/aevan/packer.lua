-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.4',
      -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }

    }

    use {"BurntSushi/ripgrep"}


    --Code Snippets
    use('L3MON4D3/LuaSnip')

    --Treesitter installs
    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use('nvim-treesitter/playground')

    --Harpoon
    use {
        "ThePrimeagen/harpoon",
    }

    --UndoTree
    use('mbbill/undotree')

    --Fugivite
    use('lewis6991/gitsigns.nvim')
    use('tpope/vim-fugitive')

    --Vim Command Completion
    use('smolck/command-completion.nvim')

    --LSP Zero
    use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
      --- Uncomment these if you want to manage LSP servers from neovim
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- LSP Support
      {'neovim/nvim-lspconfig'},
      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'L3MON4D3/LuaSnip'},
      {'saadparwaiz1/cmp_luasnip'},
      {'rafamadriz/friendly-snippets'},
    }
    }

    -- LSP formatting
    use 'onsails/lspkind.nvim'

    -- ai companions
    use('github/copilot.vim')
    use('tzachar/cmp-ai')

    --which key
    use {
    "folke/which-key.nvim",
    config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    require("which-key").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
    end
    }

    -- Debugging
    use { "mfussenegger/nvim-dap" }
    use { "leoluz/nvim-dap-go" ,
        ft="go",
        dependencies = "mfussenegger/nvim-dap",
        config = function(_, opts)
            require("dap-go").setup(opts)
        end
    }


    -- Tab Handling
    use 'nvim-tree/nvim-web-devicons' -- OPTIONAL: for file icons
    use 'romgrk/barbar.nvim'

    -- mini libraries
    use { 'echasnovski/mini.comment', branch = 'stable' }
    use { 'echasnovski/mini.pairs', branch = 'stable' }
    use { 'echasnovski/mini.surround', branch = 'stable' }

    -- LuaLine
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    -- DBT Tool
    use {
    "cfmeyers/dbt.nvim",
    requires = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
        "rcarriga/nvim-notify",
    },
    }

    use {"xiyaowong/transparent.nvim"}

    -- noice
    use {"folke/noice.nvim",
    requires = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    },
    }

    use {"folke/tokyonight.nvim"}

    --Oil NVIM
    use({
        "stevearc/oil.nvim",
        config = function()
          require("oil").setup(
          { view_options = {
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
              }, }
)
        end,
      })

    --Leap
    use {"ggandor/leap.nvim"}

    --TSJ 
    use({
        'Wansmer/treesj',
        requires = {'nvim-treesitter/nvim-treesitter'},
        config = function() require('treesj').setup({
            use_default_keymaps = false,
            cursor_behavior = 'hold',
        }) end,
    })

    --Trouble
    use({
      "folke/trouble.nvim",
      config = function()
          require("trouble").setup({})
      end,
    })

    --Multi-cursor 
    use 'mg979/vim-visual-multi'

    --DB
    use 'tpope/vim-dadbod'
    use 'kristijanhusak/vim-dadbod-ui'
    use 'kristijanhusak/vim-dadbod-completion'

    --Shellcheck
    use 'itspriddle/vim-shellcheck'

end)
