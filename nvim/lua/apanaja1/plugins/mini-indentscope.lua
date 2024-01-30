return {
	"echasnovski/mini.nvim",
	version = false,
	config = function()
		require("mini.indentscope").setup({
			draw = {
				animation = require("mini.indentscope").gen_animation.none(),
			},
			-- Which character to use for drawing scope indicator
			symbol = "|",
		})
	end,
}
