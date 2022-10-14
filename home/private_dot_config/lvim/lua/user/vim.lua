local M = {}

M.config = function()
    vim.diagnostic.config({
        virtual_text = false,
    })
end

return M
