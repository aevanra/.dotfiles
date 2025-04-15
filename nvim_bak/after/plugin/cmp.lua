local cmp_ai = require('cmp_ai.config')

cmp_ai:setup({
  max_lines = 10,
  provider = 'Ollama',
  provider_options = {
    model = 'codegemma:latest',
    auto_unload = false, -- Set to true to automatically unload the model when
    raw_response_cb = function(response)
        vim.notify(vim.inspect(response))

        vim.g.ai_raw_response = response

    end,
  },
  notify = true,
  notify_callback = function(msg)
    vim.notify(msg)
  end,
  run_on_every_keystroke = false,
  ignored_file_types = {
    -- default is not to ignore
    -- uncomment to ignore in lua:
    -- lua = true
  },
})

local cmp = require('cmp')

cmp.setup({
  formatting = {
    format = require('lspkind').cmp_format({
      mode = "symbol_text",
      maxwidth = 50,
      ellipsis_char = '...',
      show_labelDetails = true,
      symbol_map = {
        HF = "",
        OpenAI = "",
        Codestral = "",
        Bard = "",
      }
    });
  },
  mapping = {
      ['<C-x>'] = cmp.mapping(
        cmp.mapping.complete({
            config = {
                sources = cmp.config.sources({
                    { name = 'cmp_ai' }
                }),
            },
        }),
        { 'i' }
      ),
  },
  sorting = {
    priority_weight = 2,
    comparators = {
      require('cmp_ai.compare'),
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.score,
      cmp.config.compare.kind,
      cmp.config.compare.length,
      cmp.config.compare.sort_text,
      cmp.config.compare.order,
    },
  },
})


cmp.setup.filetype({ "sql" },
{
    sources = {
        { name = "vim-dadbod-completion" },
        { name = "buffer" },
    },
})

