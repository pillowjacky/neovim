----------------------
-- global variables --
----------------------

local g = vim.g

-- leader key
g.mapleader = " "
g.maplocalleader = " "

-- netrw
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

--------------------
-- editor options --
--------------------

local opt = vim.opt

-- editing
opt.breakindent = true
opt.expandtab = true
opt.shiftwidth = 2
opt.softtabstop = 2
opt.tabstop = 2
opt.virtualedit = "block"
opt.wrap = false

-- search
opt.ignorecase = true
opt.inccommand = "split"
opt.smartcase = true

-- system
opt.confirm = true
opt.mouse = "a"
opt.splitright = true
opt.splitbelow = true
opt.statusline = "%<%f %h%w%m%r%=%y %(%l:%c%V%)"
opt.swapfile = false
opt.timeoutlen = 500
opt.undofile = true
opt.updatetime = 300

-- ui
opt.cursorline = true
opt.fillchars = { eob = " " }
opt.laststatus = 3
opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
opt.number = true
opt.relativenumber = true
opt.scrolloff = 8
opt.signcolumn = "yes"
opt.smoothscroll = true
opt.termguicolors = true
opt.winminwidth = 5
