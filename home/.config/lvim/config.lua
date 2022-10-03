-- General
lvim.log.level = "warn"
lvim.format_on_save = false
lvim.colorscheme = "tokyonight-night"
lvim.line_wrap_cursor_movement = false
lvim.termguicolors = true
lvim.transparent_window = false
lvim.debug = false
lvim.leader = ","

-- Vimscript if needed
vim.cmd "source ~/.config/lvim/vimscript/user.pre.vim"

-- Builtin
require("user.builtin").config()

-- Builtin
require("user.neovim").config()

-- Cmp
require("user.cmp").config()

-- Additional Plugins
require("user.plugins").config()

-- Treesitter
require("user.treesitter").config()

-- Telescope
require("user.telescope").config()

-- Barbar
require("user.bufferline").config()

-- Status line
require("user.lualine").config()

-- Keys
require("user.keys").config()

-- Autocommands
require("user.autocmd").config()

-- Lsp
require("user.lsp").config()

-- theme
require("user.theme").tokyonight()

-- Debugging
require("user.dap").config()

-- Vimscript if needed
vim.cmd "source ~/.config/lvim/vimscript/user.post.vim"
