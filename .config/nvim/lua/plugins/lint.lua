return {
    "mfussenegger/nvim-lint",
    config = function()
        local lint = require("lint")
        lint.linters_by_ft = {
            go = { "golangcilint" },
            yaml = { "yamllint" },
        }
    end,
}
