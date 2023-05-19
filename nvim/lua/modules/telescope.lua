local function setup()
  local builtin = require('telescope.builtin')
  vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find File' })
  vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Grep' })
  vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Find Buffer' })
  vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Find Help' })

  require('which-key').register({
    ["<leader>f"] = { name = "+File" }
  })
end

return {
  'nvim-telescope/telescope.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'folke/which-key.nvim' },
  config = setup
}
