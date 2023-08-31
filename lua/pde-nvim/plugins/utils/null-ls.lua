local gu = vim.g.git_username

local M = { gu .. '/null-ls.nvim' }

M.config = function()
	local status, null_ls = pcall(require, 'null-ls')
	if not status then return end

	-- local formatting = null_ls.builtins.formatting

	null_ls.setup {
		-- sources = {
		-- 	formatting.prettier
		-- }
	}
end

return M
