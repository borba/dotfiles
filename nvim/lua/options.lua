local opt = vim.opt


-- ui

opt.showmode = true
opt.cursorline = true

opt.number = true
opt.numberwidth = 4
opt.relativenumber = true
opt.ruler = false

opt.mouse = "a"

opt.clipboard = "unnamedplus"

opt.signcolumn = "number"

opt.splitbelow = true
opt.splitright = true

-- indenting

opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2

opt.fillchars = { eob = " " }
opt.ignorecase = true
opt.smartcase = true

-- leader keys

vim.api.nvim_set_var("mapleader", " ")
vim.api.nvim_set_var("maplocalleader", ",")
