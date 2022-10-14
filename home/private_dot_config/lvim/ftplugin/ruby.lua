-- Formatting
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
    {
        exe = "rubocop",
        -- args = {},
        filetypes = { "lua" },
    },
}

-- Linting
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {}
