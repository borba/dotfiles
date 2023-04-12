local function setup_mason()
  require('mason').setup()
end

local function setup_mason_lspconfig()
  require('mason-lspconfig').setup {
    ensure_installed = {
      'bashls',
      'clojure_lsp',
      'fennel_language_server',
      'jsonls',
      'lua_ls',
      'marksman',
      'yamlls'
    }
  }
end

local function setup_lspconfig()
  local lang_dir = vim.fn.stdpath('config') .. '/lua/modules/lang'
  local handle = vim.loop.fs_scandir(lang_dir)

  while handle do
    local filename, filetype = vim.loop.fs_scandir_next(handle)
    if not filename then
      break
    end
    if filetype == 'file' then
      local found, module = pcall(require, ('modules.lang.' .. string.sub(filename, 1, -5)))
      if found and module.setup_lsp then
        module.setup_lsp()
      end
    end
  end
end

return {
  {
    'williamboman/mason.nvim',
    config = setup_mason
  },
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {'williamboman/mason.nvim'},
    config = setup_mason_lspconfig
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {'williamboman/mason-lspconfig.nvim'},
    config = setup_lspconfig
  }
}
