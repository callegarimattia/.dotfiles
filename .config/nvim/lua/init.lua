require("set")
require("remap")
require("lazy_init")

local augroup = vim.api.nvim_create_augroup
local MattiasGroup = augroup("MattiasGroup", {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup("HighlightYank", {})

function R(name)
    require("plenary.reload").reload_module(name)
end

autocmd("TextYankPost", {
    group = yank_group,
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout = 40,
        })
    end,
})

autocmd("LspAttach", {
    group = MattiasGroup,
    callback = function(e)
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end,
            { buffer = e.buf, desc = "[g]o to [d]efinition" })
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end,
            { buffer = e.buf, desc = "[K] Display hover information" })
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end,
            { buffer = e.buf, desc = "[v]iew [w]orkspace [s]ymbol" })
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end,
            { buffer = e.buf, desc = "[v]iew [d]iagnostic" })
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end,
            { buffer = e.buf, desc = "[v]iew [c]ode [a]ction" })
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end,
            { buffer = e.buf, desc = "[v]iew [rr]eferences" })
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end,
            { buffer = e.buf, desc = "[v]iew [r]ename" })
        -- vim.keymap.set("n", "<leader>vs", function() vim.lsp.buf.signature_help() end,
        --     { buffer = e.buf, desc = "[v]iew [s]ignature" })
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end,
            { buffer = e.buf, desc = "[[] go to next [d]iagnotic" })
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end,
            { buffer = e.buf, desc = "[]] go to prev [d]iagnotic" })
    end,
})
