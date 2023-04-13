local function setup_lspconfig()
  require('lspconfig').clojure_lsp.setup {}
end

return {
  setup_lsp = setup_lspconfig
}
