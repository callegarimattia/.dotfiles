return {
    "nvim-telescope/telescope.nvim",
    branch = '0.1.x',
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
        require("telescope").setup({})
        require("telescope").load_extension("fzf")
    end,
    keys = {
        { "<leader>sg", require("telescope.builtin").git_files, desc = "[s]earch telescope [g]it files" },
        { "<leader>sh", require("telescope.builtin").help_tags, desc = "[s]earch [h]elp tags" },
        {
            "<leader>sf",
            function() require("telescope.builtin").find_files({ hidden = true }) end,
            desc = "[s]earch [f]iles"
        },
        { "<leader>sl", require("telescope.builtin").live_grep,   desc = "[s]earch [l]ive" },
        { "<leader>sb", require("telescope.builtin").buffers,     desc = "[s]earch [b]uffers" },
        { "<leader>sw", require("telescope.builtin").grep_string, desc = "[s]earch [w]ord" },
        { "<leader>sk", require("telescope.builtin").keymaps,     desc = "[s]earch [k]eympas" }
    },
}
