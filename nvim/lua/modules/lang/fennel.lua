return {
  setup_lsp = function()
    require('lspconfig').fennel_language_server.setup {}
  end
}
