-- Function to get Anaconda environment
local function anaconda_env()
	local env = os.getenv("CONDA_DEFAULT_ENV")
	if env then
		return " (" .. env .. ")"
	else
		return ""
	end
end

return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")

		-- configure lualine with modified theme
		lualine.setup({
			options = {
				theme = "gruvbox",
			},
			sections = {
				lualine_a = {
					{ "mode" },
				},
				lualine_c = {},
			},
			tabline = {
				lualine_a = { "filename" },
				lualine_b = { anaconda_env },
				lualine_c = {
					{
						"navic",
						color_correction = nil,
						navic_opts = {
							auto_attach = true,
						},
					},
				},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
			-- Other configurations...
		})
	end,
}
