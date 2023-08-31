--[[
-- HELPERS
--]]

local M = {}

-- function map
-- mode	: n -> Normal, i -> Insert
-- lhs	: custom keybinds
-- rhs	: existing keybinds or commands
-- opts	: additionals options. see :h map-arguments
function M.map(mode, lhs, rhs, opts)
	local options = {
		remap	= false,
		silent	= true
	}

	if opts then
		options = vim.tbl_extend('force', options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

return M
