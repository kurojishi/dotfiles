local M = {}

M.config = function()
    lvim.plugins = {
        -- Color schemes
        {
            "folke/tokyonight.nvim",
            config = function()
                require("user/theme").tokyonight()
            end,
        },
        { "folke/lsp-colors.nvim" },
        { "lunarvim/colorschemes" },
        -- Markdown preview
        {
            "iamcco/markdown-preview.nvim",
            run = "cd app && npm install",
            ft = { "markdown" },
            config = function()
                vim.g.mkdp_auto_start = 1
                vim.g.mkdp_browser = "/usr/bin/firefox"
            end,
        },
        -- Glow markdown preview
        {
            "ellisonleao/glow.nvim",
            ft = { "markdown" },
        },
        -- Better diff view
        {
            "sindrets/diffview.nvim",
            config = function()
                require("diffview").setup()
            end,
            event = "BufRead",
        },
        -- Pick up where you left
        {
            "ethanholz/nvim-lastplace",
            event = "BufRead",
            config = function()
                require("nvim-lastplace").setup {
                    lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
                    lastplace_ignore_filetype = {
                        "gitcommit",
                        "gitrebase",
                        "svn",
                        "hgcommit",
                    },
                    lastplace_open_folds = true,
                }
            end,
        },
        {
            "tpope/vim-fugitive",
            cmd = {
                "G",
                "Git",
                "Gdiffsplit",
                "Gread",
                "Gwrite",
                "Ggrep",
                "GMove",
                "GDelete",
                "GBrowse",
                "GRemove",
                "GRename",
                "Glgrep",
                "Gedit",
            },
            ft = { "fugitive" },
        },
        -- Lsp signature
        -- Lsp signature
        {
            "ray-x/lsp_signature.nvim",
            config = function()
                require("user/lsp_signature").config()
            end,
            event = { "BufRead", "BufNew" },
        },
        -- Lsp progress lualine
        {
            "arkav/lualine-lsp-progress",
            disable = lvim.builtin.fidget.active,
        },
        -- Lsp progreess in fidget
        {
            "j-hui/fidget.nvim",
            config = function()
                require("user.fidget").config()
            end,
            disable = not lvim.builtin.fidget.active,
        },
        -- Lsp goto preview
        {
            "rmagatti/goto-preview",
            config = function()
                require("goto-preview").setup {
                    default_mappings = true,
                }
            end,
        },
        -- Diagnostics
        {
            "folke/trouble.nvim",
            cmd = "TroubleToggle",
        },
        -- More Rust LSP
        {
            "simrat39/rust-tools.nvim",
            ft = { "rust", "rs" },
            config = function()
                require("user.rust-tools").config()
            end,
        },
        -- Lsp Typescript
        {
            "jose-elias-alvarez/nvim-lsp-ts-utils",
            ft = {
                "javascript",
                "javascriptreact",
                "javascript.jsx",
                "typescript",
                "typescriptreact",
                "typescript.tsx",
            },
            opt = true,
            event = "BufReadPre",
            before = "williamboman/nvim-lsp-installer",
        },
        -- Python coverage highlight
        { "mgedmin/coverage-highlight.vim" },
        -- Goyo
        { "junegunn/goyo.vim" },
        { "junegunn/limelight.vim" },
        -- Markdown TOC
        {
            "mzlogin/vim-markdown-toc",
            ft = "markdown",
        },
        -- Screenshots
        {
            "JMcKiern/vim-shoot",
            run = "./install.py geckodriver",
            config = function()
                vim.api.nvim_set_var("shoot_zoom_factor", 1)
            end,
        },
        -- Smithy
        { "jasdel/vim-smithy" },
        -- Multi-edit support
        { "mg979/vim-visual-multi" },
        -- Colorizer
        {
            "norcalli/nvim-colorizer.lua",
            config = function()
                require("colorizer").setup()
            end,
        },
        -- Debugging UI
        {
            "rcarriga/nvim-dap-ui",
            config = function()
                require("dapui").setup()
            end,
            ft = { "python", "rust", "rs", "go", "c" },
            requires = { "mfussenegger/nvim-dap" },
            disable = not lvim.builtin.dap.active,
        },
        -- Peek line number
        {
            "nacro90/numb.nvim",
            event = "BufRead",
            config = function()
                require("numb").setup {
                    show_numbers = true,
                    show_cursorline = true,
                }
            end,
        },
        -- Spelling
        {
            "lewis6991/spellsitter.nvim",
            config = function()
                require("spellsitter").setup {
                    hl = "SpellBad",
                    captures = { "comment" },
                }
            end,
        },
        -- Github management
        {
            "pwntester/octo.nvim",
            config = function()
                require("octo").setup()
            end,
            event = "BufRead",
        },
        -- i3 syntax
        { "mboughaba/i3config.vim" },
        -- sway syntax
        { "terminalnode/sway-vim-syntax" },
        -- Tagbar on the left
        {
            "preservim/tagbar",
            cmd = "TagbarToggle",
            config = function() end,
        },
        {
            "folke/persistence.nvim",
            event = "VimEnter",
            module = "persistence",
            config = function()
                require("persistence").setup {
                    dir = vim.fn.expand(vim.fn.stdpath "config" .. "/session/"),
                    options = { "buffers", "curdir", "tabpages", "winsize" },
                }
            end,
        },
        -- TODO comments
        {
            "folke/todo-comments.nvim",
            requires = "nvim-lua/plenary.nvim",
            config = function()
                require("todo-comments").setup {}
            end,
        },
        -- Symbol outline
        {
            "simrat39/symbols-outline.nvim",
            config = function()
                local opts = {
                    highlight_hovered_item = true,
                    show_guides = true,
                    auto_preview = false,
                    position = "right",
                    width = 25,
                    show_numbers = false,
                    show_relative_numbers = false,
                    show_symbol_details = true,
                    preview_bg_highlight = "Pmenu",
                    keymaps = { -- These keymaps can be a string or a table for multiple keys
                        close = { "<Esc>", "q" },
                        goto_location = "<Cr>",
                        focus_location = "o",
                        hover_symbol = "<C-space>",
                        toggle_preview = "K",
                        rename_symbol = "r",
                        code_actions = "a",
                    },
                    lsp_blacklist = {},
                    symbol_blacklist = {},
                    symbols = {
                        File = { icon = "", hl = "TSURI" },
                        Module = { icon = "", hl = "TSNamespace" },
                        Namespace = { icon = "", hl = "TSNamespace" },
                        Package = { icon = "", hl = "TSNamespace" },
                        Class = { icon = "", hl = "TSType" },
                        Method = { icon = "ƒ", hl = "TSMethod" },
                        Property = { icon = "", hl = "TSMethod" },
                        Field = { icon = "", hl = "TSField" },
                        Constructor = { icon = "", hl = "TSConstructor" },
                        Enum = { icon = "ℰ", hl = "TSType" },
                        Interface = { icon = "ﰮ", hl = "TSType" },
                        Function = { icon = "", hl = "TSFunction" },
                        Variable = { icon = "", hl = "TSConstant" },
                        Constant = { icon = "", hl = "TSConstant" },
                        String = { icon = "𝓐", hl = "TSString" },
                        Number = { icon = "#", hl = "TSNumber" },
                        Boolean = { icon = "⊨", hl = "TSBoolean" },
                        Array = { icon = "", hl = "TSConstant" },
                        Object = { icon = "⦿", hl = "TSType" },
                        Key = { icon = "", hl = "TSType" },
                        Null = { icon = "NULL", hl = "TSType" },
                        EnumMember = { icon = "", hl = "TSField" },
                        Struct = { icon = "פּ", hl = "TSType" },
                        Event = { icon = "", hl = "TSType" },
                        Operator = { icon = "", hl = "TSOperator" },
                        TypeParameter = { icon = "𝙏", hl = "TSParameter" },
                    },
                }
                require("symbols-outline").setup(opts)
            end,
            -- cmd = "SymbolsOutline",
            event = "BufReadPost",
        },
        -- Qbf
        {
            "kevinhwang91/nvim-bqf",
            config = function()
                require("bqf").setup {
                    auto_resize_height = true,
                    func_map = {
                        tab = "st",
                        split = "sv",
                        vsplit = "sg",

                        stoggleup = "K",
                        stoggledown = "J",
                        stogglevm = "<Space>",

                        ptoggleitem = "p",
                        ptoggleauto = "P",
                        ptogglemode = "zp",

                        pscrollup = "<C-b>",
                        pscrolldown = "<C-f>",

                        prevfile = "gk",
                        nextfile = "gj",

                        prevhist = "<S-Tab>",
                        nexthist = "<Tab>",
                    },
                    preview = {
                        auto_preview = true,
                        should_preview_cb = function(bufnr)
                            local ret = true
                            local filename = vim.api.nvim_buf_get_name(bufnr)
                            local fsize = vim.fn.getfsize(filename)
                            -- file size greater than 10k can't be previewed automatically
                            if fsize > 100 * 1024 then
                                ret = false
                            end
                            return ret
                        end,
                    },
                }
            end,
            event = "BufRead",
        },
        -- Zoxide
        { "nanotee/zoxide.vim" },
        {
            "abzcoding/filetype.nvim",
            branch = "fix/qf-syntax",
            config = function()
                require("filetype").setup {
                    overrides = {
                        literal = {
                            ["kitty.conf"] = "kitty",
                            [".gitignore"] = "conf",
                        },
                    },
                }
            end,
        },
        -- Telescope zoxide
        {
            "jvgrootveld/telescope-zoxide",
            requires = { "nvim-telescope/telescope.nvim" },
        },
        -- Telescope repo
        {
            "cljoly/telescope-repo.nvim",
            requires = { "nvim-lua/plenary.nvim" },
        },
        -- Telescope file browser
        { "nvim-telescope/telescope-file-browser.nvim" },
        -- VimTex
        {
            "lervag/vimtex",
            ft = { "tex", "dvi", "pdf" },
            config = function()
                vim.cmd "call vimtex#init()"
            end,
        },
        -- Kitty sintax highlighting
        {
            "fladson/vim-kitty",
            ft = { "kitty" },
        },
        -- Sidebar
        {
            "sidebar-nvim/sidebar.nvim",
            config = function()
                require("user.sidebar").config()
            end,
            -- event = "BufRead",
            disable = not lvim.builtin.sidebar.active,
        },
        {
            "kosayoda/nvim-lightbulb",
            config = function()
                vim.fn.sign_define(
                    "LightBulbSign",
                    { text = require("user.lsp").icons.code_action, texthl = "DiagnosticInfo" }
                )
            end,
            event = "BufRead",
            ft = { "rust", "go", "python" },
        },
        -- Renamer
        {
            -- "filipdutescu/renamer.nvim",
            "abzcoding/renamer.nvim",
            branch = "develop",
            config = function()
                require("user.renamer").config()
            end,
        },
        -- Better comparison order
        { "lukas-reineke/cmp-under-comparator" },
        -- Neogen
        {
            "danymat/neogen",
            config = function()
                require("neogen").setup {
                    enabled = true,
                }
            end,
            event = "InsertEnter",
            requires = "nvim-treesitter/nvim-treesitter",
        },
        -- Telescope UI select
        { "nvim-telescope/telescope-ui-select.nvim" },
        -- Smart quit
        {
            "marklcrns/vim-smartq",
            config = function()
                vim.g.smartq_default_mappings = 0
            end,
        },
        {
            "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
            config = function()
                require("lsp_lines").setup()
            end,
        }
    }
end

return M
