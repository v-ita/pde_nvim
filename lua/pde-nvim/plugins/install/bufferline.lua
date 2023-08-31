local gu = vim.g.git_username

local M = { gu .. '/bufferline.nvim' }

M.keys = {
	{ '<tab>',   ':BufferLineCycleNext<cr>', desc = 'Next buffer' },
	{ '<s-tab>', ':BufferLineCyclePrev<cr>', desc = 'Previous buffer' }
}

M.config = function()
	local status, bufferline = pcall(require, 'bufferline')
	if not status then return end

	bufferline.setup {
		options = {
			show_buffer_close_icons = false,
			max_name_length = 64,
			offsets = {
				{
					filetype = 'NvimTree',
					text = function()
						return '  ' .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
					end,
					text_align = 'center',
					separator = true
				}
			}
		}
	}
end

return M

-- https://github.com/akinsho/bufferline.nvim
