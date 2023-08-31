local gu = vim.g.git_username

local M = { gu .. '/neosolarized.nvim' }

M.dependencies = {
	gu .. '/colorbuddy.nvim'
}

M.config = function ()
	local status, neosolarized = pcall(require, 'neosolarized')
	if not status then return end

	neosolarized.setup({
		comment_italics = true
	})
end

return M

-- https://github.com/svrana/neosolarized.nvim
