local M = { vim.g.git_username .. '/toggleterm.nvim' }

M.cmd = { 'ToggleTerm', 'ToggleTermToggleAll', 'TermExec' }

M.keys = {
	{ '<f9>', ':ToggleTerm<cr>', desc = 'Toggle Terminal' },
}

M.config = function()
	local status, toggleterm = pcall(require, 'toggleterm')
	if not status then return end

	toggleterm.setup {
		direction = 'float',
		float_opts = {
			border = 'curved' -- single, curved, double, shadow
		},
		open_mapping = [[<f9>]]
	}
end

return M

-- https://github.com/akinsho/toggleterm.nvim
