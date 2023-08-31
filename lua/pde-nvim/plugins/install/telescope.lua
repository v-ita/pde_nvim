local gu = vim.g.git_username

local M = { gu .. '/telescope.nvim' }

M.lazy = true

M.keys = {
	{ '<leader>fc', ":lua require('telescope.builtin').git_commits()<cr>", desc = 'Git commit' },
	{ '<leader>ff', ":lua require('telescope.builtin').find_files()<cr>",  desc = 'Find files' },
	{ '<leader>ft', ":lua require('telescope.builtin').colorscheme()<cr>", desc = 'Switch colorscheme' },
	{ '<leader>fh', ":lua require('telescope.builtin').help_tags()<cr>",   desc = 'Help tags' }
}

M.cmd = 'Telescope'

M.dependencies = {
	{ gu .. '/plenary.nvim' }
}

M.config = function()
	local tel_status, telescope = pcall(require, 'telescope')
	local action_status, actions = pcall(require, 'telescope.actions')

	if not tel_status or not action_status then return end

	-- fold issue: folding don't work because we leave telescope at insert mode
	-- solution: https://github.com/nvim-telescope/telescope.nvim/issues/559
	local function stopinsert(callback)
		return function(prompt_bufnr)
			vim.cmd.stopinsert()
			vim.schedule(function() callback(prompt_bufnr) end)
		end
	end

	local mappings = {
		i = {
			['<c-c>'] = actions.close,
			['<c-j>'] = actions.move_selection_next,
			['<c-k>'] = actions.move_selection_previous,
			['<c-_>'] = actions.which_key,
			['<c-u>'] = actions.preview_scrolling_up,
			['<c-d>'] = actions.preview_scrolling_down,
			['<cr>'] = stopinsert(actions.select_default),
		},
		n = {
			['<esc>'] = actions.close,
			['<cr>'] = stopinsert(actions.select_default),
			['j'] = actions.move_selection_next,
			['k'] = actions.move_selection_previous,
			['gg'] = actions.move_to_top,
			['G'] = actions.move_to_bottom,
			['<PageUp>'] = actions.results_scrolling_up,
			['<PageDown>'] = actions.results_scrolling_down,
			['<c-u>'] = actions.preview_scrolling_up,
			['<c-d>'] = actions.preview_scrolling_down,
			['?'] = actions.which_key,
		}
	}

	local theme_name = nil -- ivy, dropdown, cursor, nil
	local layout_config = {
		width = .95,
		height = .75,
		prompt_position = 'top', -- bottom, top
		preview_width = .5
	}

	telescope.setup {
		defaults = {
			mappings = mappings,
			file_ignore_patterns = {
				'.git/',
				'node_modules',
				'vendor'
			},
			layout_config = layout_config,
			prompt_prefix = '   ',
			selection_caret = '  ',
			sorting_strategy = 'ascending'
		},
		pickers = {
			colorscheme = {
				theme = theme_name
			},
			find_files = {
				theme = theme_name
			},
			git_commits = {
				theme = theme_name
			},
			help_tags = {
				theme = theme_name
			}
		}
	}
end

return M
