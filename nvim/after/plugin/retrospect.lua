local retrospect = require('retrospect')
retrospect.setup({
  saveKey = "<leader>ss", -- The shortcut to save the session, default is leader+backslash(\)
  loadKey = "<leader>sl", -- The shortcut to load the session
  style = "default" -- or "modern", if you have nui.nvim and dressing.nvim
})
