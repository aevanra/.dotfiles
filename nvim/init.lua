require("config.lazy")
require("config/remap")
require("config/set")
require("lazy").setup("plugins")
vim.cmd(":TSEnable highlight")
vim.cmd.colorscheme "catppuccin-macchiato"
