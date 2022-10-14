local M = {}

local Terminal = require("toggleterm.terminal").Terminal

M.config = function()
    lvim.builtin.terminal.autochdir = true
    lvim.builtin.terminal.active = true
    lvim.builtin.terminal.open_mapping = nil
    lvim.builtin.terminal.execs = {}
end

M.float_terminal_toggle = function(cmd, id)
    local term = Terminal:new {
        cmd = cmd,
        hidden = true,
        direction = "float",
        float_opts = {
            border = "curved"
        },
        on_open = function(_)
            vim.cmd "startinsert!"
        end,
        on_close = function(_) end,
        count = id,
    }
    term:toggle()
end

M.horizontal_terminal_toggle = function(cmd, id, size)
    local term = Terminal:new {
        cmd = cmd,
        hidden = true,
        direction = "horizontal",
        on_open = function(_)
            vim.cmd "startinsert!"
        end,
        on_close = function(_) end,
        count = id,
        size = size,
    }
    term:toggle()
end

return M