local gu = vim.g.git_username

local M = { gu .. '/nvim-treesitter' }

M.build = ':TSUpdate'

M.dependencies = {
	{ gu .. '/nvim-ts-rainbow' },
}

M.config = function()
	local status, treesitter = pcall(require, 'nvim-treesitter.configs')
	if not status then return end

	treesitter.setup {
		ensure_installed = {
			'comment',
			'css',
			'dart',
			'html',
			'javascript',
			'lua',
			'markdown',
			'php',
			'vue'
		},
		ignore_install = {},
		context_commentstring = {
			enable = true
		}
	}
end

return M

-- https://github.com/nvim-treesitter/nvim-treesitter
-- https://github.com/p00f/nvim-ts-rainbow
