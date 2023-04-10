function setup_tokyo()
  require('tokyonight').setup {
    style = 'storm',
    on_highlights = function(highlights, colors)
      highlights.LineNr.fg = '#338ba8'
      highlights.CursorLineNr.fg = '#add8e6'
    end
  }

  vim.cmd[[colorscheme tokyonight]]
end

function setup_line()
  require('lualine').setup {
    options = {
      theme = 'onelight'
    },
    sections = {
      lualine_b = {'branch', 'diagnostics'}
    }
  }
end

return {
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = setup_tokyo
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {'nvim-tree/nvim-web-devicons'},
    config = setup_line
  }
}
