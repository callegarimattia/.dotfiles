return {
    "mfussenegger/nvim-lint",
    event = "VeryLazy",
    config = function()
        local lint = require("lint")
        lint.linters_by_ft = {
            go = { "golangcilint" },
            yaml = { "yamllint" },
        }
        vim.api.nvim_create_autocmd({ "BufReadPost", "InsertLeave", "FocusGained" }, {
            callback = function()
                lint.try_lint()
            end,
        })
    end,
}