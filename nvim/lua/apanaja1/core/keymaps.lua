vim.g.mapleader = " "

local keymap = vim.keymap

---------------------
-- General Keymaps -------------------

-- use jj to exit insert mode
keymap.set("i", "jj", "<ESC>", { desc = "Exit insert mode with jk" })
-- delete single character without copying into register
keymap.set("n", "x", '"_x')
-- use ; to enter command mode
-- doesnt work
keymap.set("n", "<leader>a", ":", { noremap = true, desc = "Enter command mode" })
keymap.set("v", "<leader>a", ":", { noremap = true, desc = "Enter command mode" })

-- Paste last thing yanked, not deleted
keymap.set("n", ",p", '"0p')
keymap.set("n", ",P", '"0P')

keymap.set("n", "<leader>w", "<CMD>update<CR>", { desc = "Save current buffer" })
keymap.set("n", "<leader>q", "<CMD>quit<CR>", { desc = "Quit nvim" })

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>e", "<CMD>Oil<CR>", { desc = "Open oil" })
keymap.set("n", "<leader>x", "<CMD>RunPython<CR>", { desc = "OverseerRun" })
keymap.set("n", "<leader><leader>x", "<CMD>OverseerToggle<CR>", { desc = "OverseerToggle" })

-- Toggle virtual text and signs for all LSP clients
function toggle_virtual_text_and_signs()
	local current_config = vim.diagnostic.config()

	-- Toggle the states
	local new_virtual_text_state = not current_config.virtual_text
	local new_signs_state = not current_config.signs

	-- Update diagnostic display to apply the new states
	vim.diagnostic.config({
		virtual_text = new_virtual_text_state,
		signs = new_signs_state,
	})

	print("Virtual text and signs " .. (new_virtual_text_state and "enabled" or "disabled"))
end

-- Make the function globally accessible
_G.toggle_virtual_text_and_signs = toggle_virtual_text_and_signs

-- Bind the function to the <leader>tt key sequence
vim.api.nvim_set_keymap(
	"n",
	"<leader>tt",
	"<cmd>lua toggle_virtual_text_and_signs()<CR>",
	{ noremap = true, silent = true }
)
