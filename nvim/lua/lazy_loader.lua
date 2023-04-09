local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

function append_lazy(c, m)
  table.insert(c, require(m).lazy)
  return c
end

return {
  load = function(modules)
    local conf = require('common').reduce(append_lazy, {}, modules)
    require('lazy').setup(conf)
  end
}
