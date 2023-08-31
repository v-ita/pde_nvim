local M = { vim.g.git_username .. '/gruvbox.nvim' }

M.config = function ()
	local status, gruvbox = pcall(require, 'gruvbox')
	if not status then return end

	gruvbox.setup {}
end

return M

-- https://github.com/ellisonleao/gruvbox.nvim
