local M = {}

M.config = function()
    -- NORMAL
    lvim.keys.normal_mode = {
        -- Buffer navigation
        ["<leader><Tab>"] = "<cmd>BufferLineCycleNext<cr>",
        ["<leader><S-Tab>"] = "<cmd>BufferLineCyclePrev<cr>",
        ["<F1>"] = "<cmd>NvimTreeToggle<cr>",
        ["<F2>"] = "<cmd>TagbarToggle<cr>",
        -- Toggle mouse
        ["<F4>"] = "<cmd>SidebarNvimToggle<cr>",
        ["<F6>"] = "<cmd>MouseToggle<cr>",
        -- Windows navigation
        ["<A-Up>"] = "<cmd>wincmd k<cr>",
        ["<A-Down>"] = "<cmd>wincmd j<cr>",
        ["<A-Left>"] = "<cmd>wincmd h<cr>",
        ["<A-Right>"] = "<cmd>wincmd l<cr>",
        -- Toggle numbers
        ["<F9>"] = "<cmd>NoNuModeToggle<cr>",
        ["<F10>"] = "<cmd>NuModeToggle<cr>",
        -- Align text
        ["<"] = "<<",
        [">"] = ">>",
        -- Disable highlight
        ["<Esc><Esc>"] = "<cmd>nohlsearch<cr>",
    }
    -- INSERT
    lvim.keys.insert_mode = {
        -- Buffer navigation
        ["<Tab>"] = { 'pumvisible() ? "<C-n>" : "<Tab>"', { silent = true, noremap = true, expr = true } },
        ["<S-Tab>"] = { 'pumvisible() ? "<C-p>" : "<S-Tab>"', { silent = true, noremap = true, expr = true } },
        ["<F1>"] = "<cmd>NvimTreeToggle<cr>",
        ["<F2>"] = "<cmd>TagbarToggle<cr>",
        -- Toggle sidear
        ["<F4>"] = "<cmd>SidebarNvimToggle<cr>",
        -- Windows navigation
        ["<A-Up>"] = "<Esc><Esc> <cmd>wincmd k<cr>",
        ["<A-Down>"] = "<Esc><Esc> <cmd>wincmd j<cr>",
        ["<A-Left>"] = "<Esc><Esc> <cmd>wincmd h<cr>",
        ["<A-Right>"] = "<Esc><Esc> <cmd>wincmd l<cr>",
    }
end

M.terminal_keys = function()
    local opts = { noremap = true }
    vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
    vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
    vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
    vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
end

return M
