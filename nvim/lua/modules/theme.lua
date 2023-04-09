function setup()
  local status, tokyonight = pcall(require, 'tokyonight')

  if status then
    tokyonight.setup {
      style = "storm"
    }
    vim.cmd[[colorscheme tokyonight]]
  end
end

return {
  'folke/tokyonight.nvim',
  lazy = false,
  priority = 1000,
  config = setup
}
