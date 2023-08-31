local gu = vim.g.git_username

local M = { gu .. '/nvim-comment' }

M.dependencies = {
	{ gu ..'/nvim-ts-context-commentstring' }
}

M.config = function()
	local status, comment = pcall(require, 'nvim_comment')
	if not status then return end

	comment.setup {
		comment_empty = false,
		hook = function()
			require('ts_context_commentstring.internal').update_commentstring()
		end
	}
end

return M

-- https://github.com/terrortylor/nvim-comment
-- https://github.com/JoosepAlviste/nvim-ts-context-commentstring
