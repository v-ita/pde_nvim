local gn = vim.g.git_username
local ns = vim.g.namespace

local lp = vim.fn.stdpath('data') .. '/lazy/lazy.nvim' -- lazy path
if not vim.loop.fs_stat(lp) then
	vim.fn.system({
		'git',
		'clone',
		'https://github.com/' .. gn .. '/lazy.nvim.git',
		lp,
	})
end
vim.opt.rtp:prepend(lp)

require('lazy').setup(ns .. '.plugins.install')

-- https://github.com/folke/lazy.nvim
