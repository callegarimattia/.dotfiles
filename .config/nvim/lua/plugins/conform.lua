return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            "<leader>f",
            function()
                require("conform").format({ async = true })
            end,
            desc = "[f]ormat buffer",
        },
    },
    opts = {
        formatters_by_ft = {
            go = { "goimports", "golines", "gofumpt" },
            python = { "ruff_format" },
        },
        default_format_opts = {
            lsp_format = "fallback",
        },
        notify_on_err = true,
        notify_no_formatters = true,
    },
}
