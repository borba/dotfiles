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
  require('lspconfig').lua_ls.setup {
    settings = {
      Lua = {
        runtime = {
          version = 'LuaJIT'
        },
        diagnostics = {
          globals = {'vim'}
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
          checkThirdParty = false
        },
        telemetry = {
          enable = false
        }
      }
    }
  }
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
