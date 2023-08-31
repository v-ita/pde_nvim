local M = { vim.g.git_username .. '/lualine.nvim' }

M.event = 'VimEnter'

M.config = function ()
	local status, lualine = pcall(require, 'lualine')
	if not status then return end

	lualine.setup {}
end

return M

-- https://github.com/nvim-lualine/lualine.nvim
