return {
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/neotest-go",
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            "nvim-neotest/neotest-plenary",
        },
        config = function()
            local neotest_ns = vim.api.nvim_create_namespace("neotest")
            vim.diagnostic.config({
                virtual_text = {
                    format = function(diagnostic)
                        local message =
                            diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
                        return message
                    end,
                },
            }, neotest_ns)
            local neotest = require("neotest")
            neotest.setup({
                adapters = {
                    require("neotest-go")
                }
            })

            vim.keymap.set("n", "<leader>tc", function()
                neotest.run.run()
            end)
        end,
    },
}
