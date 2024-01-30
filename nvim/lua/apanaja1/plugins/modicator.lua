-- Notes for configuration
-- https://github.com/epwalsh/obsidian.nvim?tab=readme-ov-file#configuration-options
return {
	"mawkler/modicator.nvim",
	dependencies = "ellisonleao/gruvbox.nvim",
	init = function()
		-- These are required for Modicator to work
		vim.o.cursorline = true
		vim.o.number = true
		vim.o.termguicolors = true
	end,
	opts = {
		integration = {
			lualine = {
				enabled = true,
				-- Letter of lualine section to use (if `nil`, gets detected automatically)
				mode_section = nil,
				-- Whether to use lualine's mode highlight's foreground or background
				highlight = "bg",
			},
		},
	},
}
