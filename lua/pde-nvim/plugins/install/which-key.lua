local M = { vim.g.git_username .. '/which-key.nvim' }

M.event = 'VeryLazy'

M.config = function()
	local status, which_key = pcall(require, 'which-key')
	if not status then return end

	which_key.setup {}
end

return M

-- https://github.com/folke/which-key.nvim
