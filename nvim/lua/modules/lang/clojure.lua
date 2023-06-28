local function setup_lspconfig()
  require('lspconfig').clojure_lsp.setup {
    capabilities = require('cmp_nvim_lsp').default_capabilities()
  }
end

return {
  setup_lsp = setup_lspconfig
}
