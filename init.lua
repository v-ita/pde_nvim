--[[
-- ENTRY POINT
]]

pcall(require, 'settings')

local ns = vim.g.namespace

for _, module in pairs(require(ns)) do
	pcall(require, ns .. '.' .. module)
end
