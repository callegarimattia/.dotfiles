return {
    "stevearc/conform.nvim",
    cmd = { "ConformInfo" },
    event = { "BufWritePre" },
    keys = {
        {
            "<leader>f",
            function()
                require("conform").format({ async = true })
            end,
            mode = "",
            desc = "[f]ormat buffer"
        }
    },
    opts = {
        formatters_by_ft = {
            -- lua = { "stylua" },
            go = { "goimports", "golines", "gofumpt" },
            python = { "ruff_format" },
        },
        default_format_opts = {
            lsp_format = "fallback",
        },
        -- format_on_save = { timeout_ms = 500 },
        notify_on_err = true,
        notify_no_formatters = true,
    }
}
