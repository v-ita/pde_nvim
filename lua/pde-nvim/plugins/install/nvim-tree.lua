local gu = vim.g.git_username

local M = { gu .. '/nvim-tree.lua' }

M.cmd = {
	'NvimTreeToggle',
	'NvimTreeFindFileToggle'
}

M.keys = {
	{ '<leader>et', '<cmd>NvimTreeToggle<cr>', desc = 'Toggle explorer' },
	{ '<leader>ef', '<cmd>NvimTreeFindFileToggle<cr>', desc = 'Find file toggle'}
}

M.config = function()
	local status, nvim_tree = pcall(require, 'nvim-tree')
	if not status then return end

	nvim_tree.setup {
		disable_netrw = true,
		view = {
			adaptive_size = true,
			signcolumn = 'yes',
		},
		filters = {
			dotfiles = false,
			exclude = { '.env' },
		},
		actions = {
			open_file = {
				resize_window = true,
				quit_on_open = true
			}
		}
	}
end

return M

-- https://github.com/nvim-tree/nvim-tree.lua
