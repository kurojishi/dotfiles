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
        {
            "folke/lsp-colors.nvim",
            event = "BufRead",
        },
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
            "sindrets/diffview.nvim", config = function()
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
        -- Git
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
        -- Github
        {
            "pwntester/octo.nvim",
            requires = {
                "nvim-lua/plenary.nvim",
                "nvim-telescope/telescope.nvim",
                "kyazdani42/nvim-web-devicons",
            },
            config = function()
                require("user.octo").config()
            end,
            after = { "which-key.nvim" },
            event = "BufRead",
        },
        -- Lsp signature
        {
            "ray-x/lsp_signature.nvim",
            config = function()
                require("user/lsp_signature").config()
            end,
            event = { "BufRead", "BufNew" },
        },
        -- Lsp progreess in fidget
        {
            "j-hui/fidget.nvim",
            config = function()
                require("user.fidget").config()
            end,
        },
        -- Lsp progress lualine
        {
            "arkav/lualine-lsp-progress",
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
            "jose-elias-alvarez/typescript.nvim",
            ft = {
                "javascript",
                "javascriptreact",
                "javascript.jsx",
                "typescript",
                "typescriptreact",
                "typescript.tsx",
            },
            opt = true,
            event = { "BufReadPre", "BufNew" },
            config = function()
                require("user.null_ls.typescript").config()
            end,
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
        -- {
        --     "JMcKiern/vim-shoot",
        --     run = "./install.py geckodriver",
        --     config = function()
        --         vim.api.nvim_set_var("shoot_zoom_factor", 1)
        --     end,
        -- },
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
        -- sway syntax
        { "terminalnode/sway-vim-syntax" },
        -- Tagbar on the left
        {
            "preservim/tagbar",
            cmd = "TagbarToggle",
            config = function() end,
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
            cmd = "SymbolsOutline",
            event = "BufReadPost",
        },
        -- Qbf
        {
            "kevinhwang91/nvim-bqf",
            config = function()
                require("user.bqf").config()
            end,
            event = "BufRead",
        },
        {
            "abzcoding/filetype.nvim",
            branch = "fix/qf-syntax",
            config = function()
                require("filetype").setup {
                    overrides = {
                        literal = {
                            ["kitty.conf"] = "kitty",
                            [".gitignore"] = "conf",
                            ["waybar/config"] = "conf",
                        },
                    },
                }
            end,
        },
        -- Zoxide
        { "nanotee/zoxide.vim" },
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
            event = "BufRead",
        },
        {'editorconfig/editorconfig-vim'},
        {
            "nvim-neo-tree/neo-tree.nvim",
            branch = "v2.x",
            requires = { "MunifTanjim/nui.nvim" },
            config = function()
                require("user.neotree").config()
            end,
            disable = lvim.builtin.tree_provider ~= "neo-tree",
        },
        -- Vista
        -- TODO Doesn't work
        {
            "liuchengxu/vista.vim",
            setup = function()
                require("user.vista").config()
            end,
            event = "BufRead",
        },
        -- Refactoring
        {
            "ThePrimeagen/refactoring.nvim",
            ft = { "typescript", "javascript", "lua", "c", "cpp", "go", "python", "java", "rust", "kotlin" },
            event = "BufRead",
            config = function()
                require("user.refactoring").config()
            end,
        },
        -- Legendary
        {
            "mrjones2014/legendary.nvim",
            config = function()
                require("user.legendary").config()
            end,
        },
        -- Scrollbar
        {
            "petertriho/nvim-scrollbar",
            config = function()
                require("user.scrollbar").config()
                -- Register current position handler.
                -- require("user.scrollbar").register_current_position_handler()
            end,
            after = { "nvim-hlslens" },
        },
        ------------------------------------------------------------------------------
        -- Miscellaneous
        ------------------------------------------------------------------------------
        -- Screenshots
        {
            "segeljakt/vim-silicon",
            config = function()
                require("user.silicon").config()
            end,
        },
        -- Debugging UI
        {
            "rcarriga/nvim-dap-ui",
            config = function()
                require("user.dapui").config()
            end,
            ft = { "python", "rust", "go", "c" },
            event = "BufReadPost",
            requires = { "mfussenegger/nvim-dap" },
            disable = not lvim.builtin.dap.active,
        },
        -- TODO comments
        {
            "folke/todo-comments.nvim",
            requires = "nvim-lua/plenary.nvim",
            config = function()
                require("user.todo_comments").config()
            end,
            event = "BufRead",
        },
        -- Window picker
        {
            "s1n7ax/nvim-window-picker",
            tag = "1.*",
            config = function()
                require("window-picker").setup {
                    autoselect_one = true,
                    include_current = false,
                    filter_rules = {
                        -- filter using buffer options
                        bo = {
                            -- if the file type is one of following, the window will be ignored
                            filetype = { "neo-tree", "neo-tree-popup", "notify", "quickfix" },

                            -- if the buffer type is one of following, the window will be ignored
                            buftype = { "terminal" },
                        },
                    },
                    other_win_hl_color = "#e35e4f",
                }
            end,
        },
        {
            "kristijanhusak/orgmode.nvim",
            ft = { "org" },
            config = function()
                require("user.orgmode").setup()
            end,
        },
        --------------------------------------------------------------
        -- Spelling and grammar
        ------------------------------------------------------------------------------
        -- Spelling
        {
            "lewis6991/spellsitter.nvim",
            config = function()
                require("spellsitter").setup {
                    hl = "SpellBad",
                    captures = { "comment" },
                }
            end,
            fd = { "markdown", "text", "rst" },
        },
        -- Grammarous
        {
            "rhysd/vim-grammarous",
            cmd = "GrammarousCheck",
        },
        -- Grammar guard
        {
            "brymer-meneses/grammar-guard.nvim",
            filetype = { "latex", "tex", "bib", "markdown", "rst", "text" },
            requires = { "neovim/nvim-lspconfig" },
        },
        -- Session manager
        {
            "crisidev/persisted.nvim",
            config = function()
                require("persisted").setup {
                    use_git_branch = true,
                    autosave = true,
                    autoload = false,
                    after_source = function()
                        -- Reload the LSP servers
                        vim.lsp.stop_client(vim.lsp.get_active_clients())
                    end,
                    telescope = {
                        before_source = function()
                            -- Close all open buffers
                            -- Thanks to https://github.com/avently
                            vim.api.nvim_input "<ESC>:%bd<CR>"
                        end,
                        after_source = function(session)
                            print("Loaded session " .. session.name)
                        end,
                    },
                }
            end,
        },
    }
end

return M
