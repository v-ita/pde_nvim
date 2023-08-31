local M = { vim.g.git_username .. '/tagbar' }

M.config = function() end

M.keys = {
	{ '<f8>', ':TagbarToggle<cr>', desc = 'Toggle tagbar' },
}

return M

-- https://github.com/preservim/tagbar
