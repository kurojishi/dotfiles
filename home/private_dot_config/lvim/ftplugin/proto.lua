-- Formatters setup
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
    {
        exe = "buf",
        filetypes = { "proto" },
    },
}
-- Linters setup
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
    {
        exe = "buf",
        filetypes = { "proto" },
    },
}
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "clangd" })
