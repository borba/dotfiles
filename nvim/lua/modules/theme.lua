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
  plugins = function(use)
    use {
      'folke/tokyonight.nvim',
      config = setup
    }
  end,

  setup = setup
}
