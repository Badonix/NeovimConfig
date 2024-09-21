local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "badonix.lsp.mason"
require("badonix.lsp.handlers").setup()
require "badonix.lsp.none-ls"
