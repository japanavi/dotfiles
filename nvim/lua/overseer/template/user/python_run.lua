return {
	name = "python",
	builder = function()
		-- Full path to current file (see :help expand())
		local file = vim.fn.expand("%:p")
		local python = string.format("%s/bin/python", os.getenv("CONDA_PREFIX"))
		return {
			cmd = { python },
			args = { file },
			components = {
				{ "on_complete_notify", statuses = { "FAILURE" } },
				"default",
			},
		}
	end,
	condition = {
		filetype = { "python" },
	},
}
