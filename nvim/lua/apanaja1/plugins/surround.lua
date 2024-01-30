return {
	"tpope/vim-surround",
	config = function()
		vim.keymap.set("n", "<leader>p", "<Plug>Ysurroundiw")
		vim.keymap.set("n", "<leader><leader>p", "<Plug>Yssurround")
	end,
}
