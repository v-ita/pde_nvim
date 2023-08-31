local M = { vim.g.git_username .. '/nvim-ts-autotag' }

M.ft = { 'html', 'javascript', 'vue', 'markdown', 'php' }

M.config = function()
	local status, autotag = pcall(require, 'nvim-ts-autotag')
	if not status then return end

	autotag.setup {
		enable = true,
		filetypes = {
			'html',
			'javascript',
			'vue',
			'php',
			'markdown'
		},
		skip_tags = {
			'area',
			'base',
			'br',
			'col',
			'command',
			'embed',
			'hr',
			'img',
			'slot',
			'input',
			'keygen',
			'link',
			'meta',
			'param',
			'source',
			'track',
			'wbr',
			'menuitem'
		}
	}
end

return M

-- https://github.com/windwp/nvim-ts-autotag
