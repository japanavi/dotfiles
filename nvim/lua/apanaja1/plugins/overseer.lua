return {
	"stevearc/overseer.nvim",
	config = function()
		require("overseer").setup({
			strategy = {
				"terminal",
				direction = "vertical",
				open_on_start = true,
			},
			templates = {
				"builtin",
				"user.python_run",
			},
			task_list = {
				direction = "right",
				width = 60,
			},
		})

		vim.api.nvim_create_user_command("OverseerRestartLastPython", function()
			local overseer = require("overseer")
			local tasks = overseer.list_tasks({ recent_first = true, name = "python" })
			-- TODO: cross check current task is same as last to run correct one
			-- If no previous tasks run python template
			if vim.tbl_isempty(tasks) then
				vim.cmd("RunPython")
			else
				-- If previous task, check how many
				-- Need to list only python tasks
				if tasks[1].name == tasks[2].name then
					overseer.run_action(tasks[1], "restart")
				else
					vim.cmd("RunPython")
				end
			end
		end, {})

		vim.api.nvim_create_user_command("RunPython", function()
			local overseer = require("overseer")
			overseer.run_template({ name = "python" }, function(task)
				if task then
					-- local main_win = vim.api.nvim_get_current_win()
					overseer.run_action(task, "open vsplit")
					-- vim.api.nvim_set_current_win(main_win)
				else
					vim.notify("RunPython not supported for filetype " .. vim.bo.filetype, vim.log.levels.ERROR)
				end
			end)
		end, {})

		vim.api.nvim_create_user_command("WatchRun", function()
			local overseer = require("overseer")
			overseer.run_template({ name = "python" }, function(task)
				if task then
					task:add_component({ "restart_on_save", paths = { vim.fn.expand("%:p") } })
					local main_win = vim.api.nvim_get_current_win()
					overseer.run_action(task, "open vsplit")
					vim.api.nvim_set_current_win(main_win)
				else
					vim.notify("WatchRun not supported for filetype " .. vim.bo.filetype, vim.log.levels.ERROR)
				end
			end)
		end, {})
	end,
}
