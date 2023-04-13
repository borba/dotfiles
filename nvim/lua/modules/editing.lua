local opt = vim.opt

-- indenting

opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2

opt.fillchars = { eob = " " }
opt.ignorecase = true
opt.smartcase = true

return {
  'cappyzawa/trim.nvim',
  config = function()
    require("trim").setup {}
  end
}
