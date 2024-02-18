local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)


vim.g.mapleader = " "

return require('lazy').setup(
    {
        {
            'nvim-telescope/telescope.nvim',
            tag = '0.1.5', -- or branch = '0.1.x',
            dependencies = { 'nvim-lua/plenary.nvim' }
        },
        {
            'rebelot/kanagawa.nvim',
            as = 'kanagawa',
            config = function()
                vim.cmd('colorscheme kanagawa')
            end
        },
        {
            'nvim-treesitter/nvim-treesitter',
            build = function()
                local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
                ts_update()
            end,
        },
        "nvim-treesitter/playground",
        "nvim-lua/plenary.nvim", -- don't forget to add this one if you don't have it yet!
        {
            "ThePrimeagen/harpoon",
            branch = "harpoon2",
            dependencies = { { "nvim-lua/plenary.nvim" } }
        },
        "mbbill/undotree",
        "tpope/vim-fugitive",
        "tpope/vim-vinegar",
        "tpope/vim-surround",
        {
            'VonHeikemen/lsp-zero.nvim',
            branch = 'v3.x',
            dependencies = {
                --- Uncomment the two plugins below if you want to manage the language servers from neovim

                -- LSP Support
                { 'neovim/nvim-lspconfig' },
                -- Autocompletion
                { 'hrsh7th/nvim-cmp' },
                { 'hrsh7th/cmp-nvim-lsp' },
                { 'L3MON4D3/LuaSnip' },
            }
        },
        {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",
        },
        'lervag/vimtex',
        {
            "L3MON4D3/LuaSnip",
            -- follow latest release.
            version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
            -- install jsregexp (optional!:).
            build = "make install_jsregexp"
        },
        {
            'smoka7/hop.nvim',
            version = '*', -- optional but strongly recommended
            config = function()
                -- you can configure Hop the way you like here; see :h hop-config
                require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
            end
        },
        {
            "folke/trouble.nvim",
            config = function()
                require("trouble").setup {
                    icons = false,
                }
            end
        },
        'segeljakt/vim-silicon',
        {
            'nvim-lualine/lualine.nvim',
            dependencies = { 'nvim-tree/nvim-web-devicons', opt = true }
        },
        {
            "folke/noice.nvim",
            config = function()
                require("noice").setup({
                    cmdline = {
                        view = "cmdline",
                    },
                    routes = {
                        {
                            filter = {
                                event = 'msg_show',
                                any = {
                                    { find = '%d+L, %d+B' },
                                    { find = '; after #%d+' },
                                    { find = '; before #%d+' },
                                    { find = '%d fewer lines' },
                                    { find = '%d more lines' },
                                },
                            },
                            opts = { skip = true },
                        }
                    },
                })
            end,
            dependencies = {
                -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
                "MunifTanjim/nui.nvim",
                -- OPTIONAL:
                --   `nvim-notify` is only needed, if you want to use the notification view.
                --   If not available, we use `mini` as the fallback
                "rcarriga/nvim-notify",
            }
        }
    })
