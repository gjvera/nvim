 return {
     "p00f/nvim-ts-rainbow",
     {
         "TroyFletcher/vim-colors-synthwave",
         lazy = false,
         config = function()
           vim.cmd.colorscheme "synthwave"
         end,
     },
     {
         'windwp/nvim-autopairs',
         event = "InsertEnter",
         opts = {}
     },
     "tpope/vim-surround",
     "tpope/vim-commentary",
     { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
     "neovim/nvim-lspconfig",
     "HiPhish/rainbow-delimiters.nvim",
     {
         "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            "saadparwaiz1/cmp_luasnip",
            "L3MON4D3/LuaSnip",
        },
        config = function()
            local cmp = require("cmp")
            cmp.setup({
                mapping = cmp.mapping.preset.insert({
                    ["<C-k>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-j>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "nvim_lua" }
                }),
            })
        end
     },
     "hrsh7th/cmp-nvim-lsp",
     "saadparwaiz1/cmp_luasnip",
     "L3MON4D3/LuaSnip",
     "folke/tokyonight.nvim",
     {
        "MunifTanjim/prettier.nvim",
        config = function()
            require("prettier").setup({
              cli_options = {
                config_precedence = "prefer-file",
              },
              bin = 'prettierd',
              filetypes = {
                "css",
                "graphql",
                "html",
                "javascript",
                "javascriptreact",
                "json",
                "less",
                "markdown",
                "scss",
                "typescript",
                "typescriptreact",
                "yaml",
              },
            })
        end
     },
    {
         "nvim-treesitter/nvim-treesitter",
         config = function()
             require'nvim-treesitter.configs'.setup {
               ensure_installed = "all",
               sync_install = false,
               highlight = {
                 enable = true,
                 additional_vim_regex_highlighting = false,
               },
             }
         end
    },
    {
         "nvim-telescope/telescope.nvim",
         keys = {
           { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "live grep" },
           { "<C-p>", "<cmd>Telescope find_files<cr>", desc = "find files" },
         },
         dependencies = {
           "nvim-lua/plenary.nvim",
         },
         config = function()
           require("telescope").setup()
         end,
    },
    {
         "norcalli/nvim-colorizer.lua",
         config = function()
             require'colorizer'.setup()
         end
    },
    {
       "nvim-neo-tree/neo-tree.nvim",
         keys = {
           { "<C-n>", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
         },
         dependencies = {
           "nvim-lua/plenary.nvim",
           "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
           "MunifTanjim/nui.nvim",
           -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
         },
         config = function()
           require("neo-tree").setup()
         end,
    },
    {
        "mfussenegger/nvim-jdtls",
        ft = "java",
         config = function()
            local jdtls_config = {
                cmd = {'/opt/homebrew/bin/jdtls'},
                root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
            }
            require('jdtls').start_or_attach(jdtls_config)
           require("neo-tree").setup()
         end,
    }
 }
