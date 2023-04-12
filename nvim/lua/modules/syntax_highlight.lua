local function setup()
  require('nvim-treesitter.configs').setup {
    ensure_installed = {
      'bash',
      'clojure',
      'fennel',
      'gitignore',
      'html',
      'json',
      'lua',
      'markdown_inline',
      'yaml'
    },
    highlight = {
      enabled = true
    },
    indent = {
      enabled = true
    }
  }
end

return {
  'nvim-treesitter/nvim-treesitter',
  config = setup
}
