local opt = vim.opt
local api = vim.api

api.nvim_command("au TermOpen * setlocal nonumber") -- no numbers
api.nvim_command("autocmd TermEnter * setlocal signcolumn=no") -- no sign column

-- Default to not show virtual_text or signs
vim.diagnostic.config({ virtual_text = false, signs = false })

opt.splitright = true
opt.splitbelow = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.guicursor = ""
opt.cursorline = true
opt.number = true
opt.relativenumber = true

opt.incsearch = true
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift
opt.scrolloff = 8
opt.colorcolumn = "90"
opt.hlsearch = false
opt.swapfile = false
opt.backup = false
opt.wrap = false

opt.cmdheight = 0
