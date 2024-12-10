return {
    'catppuccin/nvim',
    name = "catppucin",
    priority = 1000,
    setup = {
        integrations = {
            cmp        = true,
            gitsigns   = true,
            treesitter = true,
            beacon     = true,
            fidget     = true,
            harpoon    = true,
            lualine    = true,
            neotest    = true,
            trouble    = true,
        }
    }
}
