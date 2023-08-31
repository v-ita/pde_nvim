local gu = vim.g.git_username

local M = { gu .. '/nvim-autopairs' }

M.config = function()
	local status, npairs = pcall(require, 'nvim-autopairs')
	if not status then return end

	npairs.setup({
		check_ts = true,
		disable_filetype = { 'TelescopePrompt' },
	})

	local Rule = require 'nvim-autopairs.rule'
    local ts_conds = require 'nvim-autopairs.ts-conds'

	-- add two spaces between {{ | }} 
	-- - check_ts is required
	npairs.add_rules {
        Rule('{{', '  }', 'vue')
            :set_end_pair_length(2)
            :with_pair(ts_conds.is_ts_node 'text'),
    }
end

return M
