local gu = vim.g.git_username

local M = { gu .. '/gitsigns.nvim' }

M.dependencies = {
	{ gu .. '/plenary.nvim' }
}

M.cmd = {
    'Gitsigns',
}

M.event = {
    'BufEnter', "BufReadPre", "BufNewFile"
}

M.keys = {
	{ '<leader>gp', ':Gitsigns preview_hunk<cr>', desc = 'Gitsigns preview hunk' },
	{ '<leader>gr', ':Gitsigns reset_hunk<cr>',   desc = 'Gitsigns reset hunk' },
	{ '<leader>gn', ':Gitsigns next_hunk<cr>',    desc = 'Gitsigns next hunk' },
	{ '<leader>gd', ':Gitsigns diffthis<cr>',     desc = 'Gitsigns diffthis' }
}

M.config = function ()
	local status, gitsigns = pcall(require, 'gitsigns')
	if not status then return end

	gitsigns.setup {}

end

return M

-- https://github.com/lewis6991/gitsigns.nvim
-- https://github.com/nvim-lua/plenary.nvim
