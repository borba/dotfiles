function setup()
  require('tokyonight').setup {
    style = 'storm'
  }

  vim.cmd[[colorscheme tokyonight]]
end

return {
  'folke/tokyonight.nvim',
  lazy = false,
  priority = 1000,
  config = setup,

  'itchyny/lightline.vim'
}
