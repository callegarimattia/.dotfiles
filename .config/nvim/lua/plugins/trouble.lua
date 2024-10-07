return {
	"folke/trouble.nvim",
	opts = {},
    event = "VeryLazy",
	cmd = "Trouble",
	keys = {
		{
			"<leader>dt",
			"<cmd>Trouble diagnostics toggle<cr>",
			desc = "[d]iagnostic [t]oggle",
		},
		{
			"<leader>db",
			"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
			desc = "[d]iagnostic [b]uffer",
		},
		{
			"<leader>ds",
			"<cmd>Trouble symbols toggle focus=false<cr>",
			desc = "[d]iagnostic [s]ymbol",
		},
		{
			"<leader>dl",
			"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
			desc = "[d]iagnostic [l]sp",
		},
		{
			"<leader>dlo",
			"<cmd>Trouble loclist toggle<cr>",
			desc = "[d]iagnostic [lo]clist",
		},
		{
			"<leader>dq",
			"<cmd>Trouble qflist toggle<cr>",
			desc = "[d]iagnostic [q]uickfix list",
		},
	},
}
