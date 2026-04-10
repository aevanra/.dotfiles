return {
  -- nvim-treesitter plugin setup
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    lazy = false,
    config = function()
      -- Enable treesitter highlighting for all buffers
      vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
        callback = function(args)
          local buf = args.buf
          local ft = vim.bo[buf].filetype

          -- Only start treesitter for normal buffers with a parser available
          if vim.bo[buf].buftype == "" and ft ~= "" then
            local lang = vim.treesitter.language.get_lang(ft)
            if lang and pcall(vim.treesitter.language.add, lang) then
              pcall(vim.treesitter.start, buf)
            end
          end
        end,
      })
    end,
  },

  -- Treesj plugin for code formatting and alignment
  {
    'Wansmer/treesj',
    opts = {
      use_default_keymaps = false, -- Disable default keymaps
      cursor_behavior = "hold",    -- Keep the cursor in place after formatting
    },
  },
}
