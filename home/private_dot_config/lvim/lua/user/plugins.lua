local M = {}

M.config = function()
    lvim.plugins = {
        ------------------------------------------------------------------------------
        -- Themes and visual stuff.
        ------------------------------------------------------------------------------
        -- Colorizer
        {
            "norcalli/nvim-colorizer.lua",
            config = function()
                require("user.colorizer").config()
            end,
        },
        {
            "folke/tokyonight.nvim",
            conig = function()
                vim.g.tokyonight_sidebars = {
                    "qf",
                    "vista_kind",
                    "terminal",
                    "packer",
                    "spectre_panel",
                    "NeogitStatus",
                    "help",
                }
                vim.g.tokyonight_cterm_colors = false
                vim.g.tokyonight_terminal_colors = true
                vim.g.tokyonight_italic_comments = false
                vim.g.tokyonight_italic_keywords = true
                vim.g.tokyonight_italic_functions = false
                vim.g.tokyonight_italic_variables = false
                vim.g.tokyonight_transparent = false
                vim.g.tokyonight_hide_inactive_statusline = true
                vim.g.tokyonight_dark_sidebar = true
                vim.g.tokyonight_dark_float = true
                vim.g.tokyonight_dim_inactive = true
                vim.g.tokyonight_global_status = true
                vim.g.tokyonight_colors = {
                    git = { change = "#6183bb", add = "#449dab", delete = "#f7768e", conflict = "#bb7a61" },
                }
            end
        },
        {
            'kosayoda/nvim-lightbulb',
            requires = 'antoinemadec/FixCursorHold.nvim',
        },
        ------------------------------------------------------------------------------
        -- Git and VCS.
        ------------------------------------------------------------------------------
        -- Fugitive
        {
            "tpope/vim-fugitive",
            cmd = { "Git", "Gdiffsplit" },
            ft = { "fugitive" },
        },
        -- Git blame
        {
            "APZelos/blamer.nvim",
            setup = function()
                local icons = require("user.icons").icons
                vim.g.blamer_enabled = 0
                vim.g.blamer_prefix = " " .. icons.magic .. " "
                vim.g.blamer_template = "<committer-time> • <author> • <summary>"
                vim.g.blamer_relative_time = 1
                vim.g.blamer_delay = 200
                vim.cmd "highlight Blamer guifg=#d3d3d3"
            end,
        },
        -- Github management
        {
            "pwntester/octo.nvim",
            config = function()
                require("user.octo").config()
            end,
            after = { "which-key.nvim" },
            event = "BufRead",
        },
        ------------------------------------------------------------------------------
        -- Telescope extensions.
        ------------------------------------------------------------------------------
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
        -- Telescope live grep
        { "nvim-telescope/telescope-live-grep-args.nvim" },
        {
            "sudormrfbin/cheatsheet.nvim",
            requires = {
                { "nvim-telescope/telescope.nvim" },
                { "nvim-lua/popup.nvim" },
                { "nvim-lua/plenary.nvim" },
            },
        },
        ------------------------------------------------------------------------------
        -- LSP extensions.
        ------------------------------------------------------------------------------
        -- Lsp signature
        {
            "ray-x/lsp_signature.nvim",
            config = function()
                require("user/lsp_signature").config()
            end,
            event = { "BufRead", "BufNew" },
            disable = not lvim.builtin.lsp_signature_help.active,
        },
        -- Lsp progreess in fidget
        {
            "j-hui/fidget.nvim",
            config = function()
                require("user.fidget").config()
            end,
        },
        -- Lsp Rust
        {
            "simrat39/rust-tools.nvim",
            ft = { "rust", "rs" },
            config = function()
                require("user.lsp.rust").config()
            end,
        },
        -- Lsp java
        {
            "mfussenegger/nvim-jdtls",
            ft = "java",
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
                require("user.lsp.typescript").config()
            end,
        },
        -- Lsp Cland Extensions
        {
            "p00f/clangd_extensions.nvim",
            ft = { "c", "cpp", "objc", "objcpp" },
            config = function()
                require("user.lsp.c").config()
            end,
        },
        -- Lsp lines
        {
            "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
            config = function()
                require("lsp_lines").setup()
            end,
            event = "BufRead",
        },
        -- Diagnostics on right corner.
        {
            "santigo-zero/right-corner-diagnostics.nvim",
            event = "LspAttach",
            config = function()
                require("rcd").setup {
                    position = "bottom",
                    auto_cmds = true,
                }
            end,
            disable = true,
        },
        -- Crates cmp
        {
            "Saecki/crates.nvim",
            event = { "BufRead Cargo.toml" },
            requires = { "nvim-lua/plenary.nvim" },
            config = function()
                require("crates").setup {
                    null_ls = {
                        enabled = true,
                        name = "crates",
                    },
                }
            end,
        },
        -- Scala metals
        {
            "scalameta/nvim-metals",
            requires = { "nvim-lua/plenary.nvim" },
            ft = { "scala", "sbt" },
        },
        ------------------------------------------------------------------------------
        -- Copilot baby..
        ------------------------------------------------------------------------------
        -- Copilot
        {
            "github/copilot.vim",
            config = function()
                require("user.copilot").config()
            end,
            disable = true,
        },
        -- Copilot Lua
        {
            "zbirenbaum/copilot.lua",
            event = "VimEnter",
            disable = not lvim.builtin.copilot.active,
        },
        {
            "zbirenbaum/copilot-cmp",
            after = { "copilot.lua", "nvim-cmp" },
            config = function()
                require("copilot_cmp").setup()
            end,
            disable = not lvim.builtin.copilot.active,
        },
        ------------------------------------------------------------------------------
        -- Cmp all the things.
        ------------------------------------------------------------------------------
        -- Cmp for command line
        { "hrsh7th/cmp-cmdline" },
        { "dmitmel/cmp-cmdline-history" },
        -- Cmp for emojis..
        { "hrsh7th/cmp-emoji" },
        -- Cmp for to calculate maths expressions.
        { "hrsh7th/cmp-calc" },
        -- Cmp for spelling and dictionary.
        { "f3fora/cmp-spell" },
        {
            "uga-rosa/cmp-dictionary",
            config = function()
                require("cmp_dictionary").setup {
                    dic = {
                        ["markdown"] = { "/usr/share/dict/words", "/usr/share/dict/british-english" },
                        ["rst"] = { "/usr/share/dict/words", "/usr/share/dict/british-english" },
                        ["*"] = {},
                    },
                }
            end,
            rocks = { "mpack" },
        },
        -- Cmp for github/gitlab issues
        {
            "petertriho/cmp-git",
            requires = "nvim-lua/plenary.nvim",
            config = function()
                require("cmp_git").setup()
            end,
        },
        { "hrsh7th/cmp-nvim-lsp-signature-help" },
        ------------------------------------------------------------------------------
        -- Markdown support
        ------------------------------------------------------------------------------
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
        -- Markdown TOC
        {
            "mzlogin/vim-markdown-toc",
            ft = "markdown",
        },
        ------------------------------------------------------------------------------
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
        -- Pick up where you left
        {
            "vladdoster/remember.nvim",
            config = function()
                require("remember").setup {}
            end,
            event = "BufWinEnter",
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
        ------------------------------------------------------------------------------
        -- Zen mode
        ------------------------------------------------------------------------------
        {
            "folke/zen-mode.nvim",
            config = function()
                require("user.zen").config()
            end,
            event = "BufRead",
        },
        {
            "folke/twilight.nvim",
            config = function()
                require("user.twilight").config()
            end,
            event = "BufRead",
            disable = not lvim.builtin.twilight.enable,
        },
        ------------------------------------------------------------------------------
        -- Search and replace
        ------------------------------------------------------------------------------
        -- Hlslens
        {
            "kevinhwang91/nvim-hlslens",
            config = function()
                require("user.hlslens").config()
            end,
            event = "BufReadPost",
        },
        -- Spectre
        {
            "windwp/nvim-spectre",
            event = "BufRead",
            config = function()
                require("user.spectre").config()
            end,
        },
        ------------------------------------------------------------------------------
        -- Miscellaneous
        ------------------------------------------------------------------------------
        -- Python coverage highlight
        { "mgedmin/coverage-highlight.vim" },
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
        -- Qbf
        {
            "kevinhwang91/nvim-bqf",
            config = function()
                require("user.bqf").config()
            end,
            event = "BufRead",
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
        -- Zoxide
        { "nanotee/zoxide.vim" },
        -- Stable window open
        {
            "luukvbaal/stabilize.nvim",
            config = function()
                require("stabilize").setup {
                    forcemark = "f",
                    nested = "QuickFixCmdPost,User LspDiagnosticsChanged",
                }
            end,
        },
        -- Trouble
        { "folke/trouble.nvim" },
        -- Editor config
        {
            "editorconfig/editorconfig-vim",
            event = "BufRead",
        },
        -- Dressing
        {
            "stevearc/dressing.nvim",
            config = function()
                require("user.dress").config()
            end,
            event = "BufWinEnter",
        },
        -- Vista
        {
            "liuchengxu/vista.vim",
            setup = function()
                require("user.vista").config()
            end,
            event = "BufReadPost",
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
        -- Filetypes overrides
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
        -- i3 syntax
        { "mboughaba/i3config.vim" },
        -- sway syntax
        { "terminalnode/sway-vim-syntax" },
        -- Kitty sintax highlighting
        {
            "fladson/vim-kitty",
            ft = { "kitty" },
        },
        -- VimTex
        {
            "lervag/vimtex",
            ft = { "tex", "dvi", "pdf" },
            config = function()
                vim.cmd "call vimtex#init()"
            end,
        },
        -- Visual multi
        {
            "mg979/vim-visual-multi",
            config = function()
                vim.cmd [[
                    let g:VM_maps = {}
                    let g:VM_maps['Find Under'] = '<C-l>'
                ]]
            end,
            branch = "master",
        },
        -- Incline
        {
            "b0o/incline.nvim",
            config = function()
                require("user.incline").config()
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
        -- Preview jumps
        {
            "nacro90/numb.nvim",
            event = "BufRead",
            config = function()
                require("numb").setup {
                    show_numbers = true, -- Enable 'number' for the window while peeking
                    show_cursorline = true, -- Enable 'cursorline' for the window while peeking
                }
            end,
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
            "lewis6991/spaceless.nvim",
            config = function()
                require("spaceless").setup()
            end,
        },
        {
            "nvim-neo-tree/neo-tree.nvim",
            branch = "v2.x",
            requires = { "MunifTanjim/nui.nvim" },
            config = function()
                require("user.neotree").config()
            end,
            disable = lvim.builtin.tree_provider ~= "neo-tree",
        },
        {
            "kristijanhusak/orgmode.nvim",
            ft = { "org" },
            config = function()
                require("user.orgmode").setup()
            end,
        },
    }
end

return M