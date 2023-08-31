local M = { vim.g.git_username .. '/nvim-colorizer.lua' }

M.config = function ()
	local status, colorizer = pcall(require, 'colorizer')
	if not status then return end

	colorizer.setup {
		'*',
		filetypes = {
			'html',
			'css',
			'javascript',
			'lua',
			'vue'
		},
		-- user_default_options = {
		-- 	mode = 'background',
		-- 	tailwind = true
		-- }
	}
end

return M

-- https://github.com/norcalli/nvim-colorizer.lua
