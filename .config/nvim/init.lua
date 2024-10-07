require("set")
require("remap")
require("lazy_init")

function R(name)
    require("plenary.reload").reload_module(name)
end

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup("HighlightYank", {})
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

local MattiasGroup = augroup("MattiasGroup", {})
autocmd("LspAttach", {
    group = MattiasGroup,
    callback = function()
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, { desc = "[g]o to [d]efinition" })
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, { desc = "display hover information " })
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, { desc = "[v]iew [s]ymbol" })
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, { desc = "[v]iew [d]iagnostics" })
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, { desc = "[v]iew [c]ode [a]ction" })
        vim.keymap.set("n", "<leader>vr", function() vim.lsp.buf.references() end, { desc = "[v]iew [r]eferences" })
        vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, { desc = "[r]e[n]ame" })
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, { desc = "view signature help" })
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, { desc = "next diagnostic" })
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, { desc = "prev diagnostic" })
    end,
})

-- lint after leaving insert or saving
autocmd({ "BufReadPost", "InsertLeave", "FocusGained" }, {
    callback = function()
        local lint_status, lint = pcall(require, "lint")
        if lint_status then
            lint.try_lint()
        end
    end,
})
