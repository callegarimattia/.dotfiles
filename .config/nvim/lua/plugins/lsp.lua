return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim",
        "onsails/lspkind.nvim",
        { "L3MON4D3/LuaSnip", build = "make install_jsregexp" },
    },

    config = function()
        local cmp = require("cmp")
        local lspkind = require("lspkind")

        lspkind.init({})

        local cmp_lsp = require("cmp_nvim_lsp")
        local lspconfig = require("lspconfig")
        local cmp_autopairs = require("nvim-autopairs.completion.cmp")
        local ls = require("luasnip")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities()
        )

        require("fidget").setup({})
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "gopls",
                "pyright",
            },
            handlers = {
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup({
                        capabilities = capabilities,
                    })
                end,

                ["lua_ls"] = function()
                    lspconfig.lua_ls.setup({
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                version = { "LuaJIT" },
                                diagnostics = {
                                    globals = {
                                        "vim",
                                        "it",
                                        "describe",
                                        "before_each",
                                        "after_each",
                                    },
                                },
                                telemetry = {
                                    enable = false,
                                },
                            },
                        },
                    })
                end,

                ["gopls"] = function()
                    lspconfig.gopls.setup({
                        capabilities = capabilities,
                        settings = {
                            Go = {
                                buildFlags = { "unit", "integration" },
                                analyses = {
                                    staticcheck = true,
                                    shadow = true,
                                    unusedvariables = true,
                                    useany = true,
                                },
                                gofumpt = true,
                            },
                        },
                    })
                end,

                ["pyright"] = function()
                    lspconfig.pyright.setup({
                        {
                            capabilities = capabilities,
                            settings = {
                                python = {
                                    analysis = {
                                        autoSearchPaths = true,
                                        diagnosticMode = "openFilesOnly",
                                        useLibraryCodeForTypes = true
                                    }
                                }
                            }
                        }
                    })
                end
            },
        })

        local cmp_insert = { behavior = cmp.SelectBehavior.Insert }
        cmp.setup({
            sources = {
                { name = "nvim_lsp" },
                { name = "lazydev" },
                { name = "path" },
                { name = "buffer" },
            },
            mapping = {
                ["<C-n>"] = cmp.mapping.select_next_item(cmp_insert),
                ["<C-p>"] = cmp.mapping.select_prev_item(cmp_insert),
                ["<C-y>"] = cmp.mapping(
                    cmp.mapping.confirm({
                        select = true,
                        behavior = cmp_insert,
                    }),
                    { "i", "c" }
                ),
            },

            -- Enable luasnip to handle snippet expansions for nvim-cmp
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
        })

        ls.config.set_config({
            hystory = false,
            updateevents = "TextChanged,TextChangedI",
        })

        -- Loads custom snippets
        for _, ft_path in ipairs(vim.api.nvim_get_runtime_file("lua/custom/snippets/*.lua", true)) do
            loadfile(ft_path)()
        end

        cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

        vim.keymap.set({ "i", "s" }, "<C-k>", function()
            if ls.expand_or_jumpable() then
                ls.expand_or_jump()
            end
        end, { silent = true })

        vim.keymap.set({ "i", "s" }, "<C-j>", function()
            if ls.jumpable(-1) then
                ls.jump(-1)
            end
        end, { silent = true })

        vim.diagnostic.config({
            update_in_insert = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = true,
                header = "",
                prefix = "",
            },
        })
    end,
}
