--[[
-- OPTIONS
--]]

local o = vim.opt
local g = vim.g

-- theme
o.termguicolors = true
o.syntax = 'on'

-- cursor
o.cursorline = true

-- keymaps: leaders
g.mapleader = ' '
g.maplocalleader = ' '

-- encoding
o.fileencoding = 'utf-8'

-- line number
o.number = true
o.relativenumber = true

-- tabulation
o.tabstop = 4
o.shiftwidth = 4
o.shiftround = true
o.smartindent = true

-- scroll
o.scrolloff = 8
o.sidescrolloff = 8

-- split
o.splitright = true
o.splitbelow = true

-- command
o.laststatus = 0

-- folding
o.foldmethod = "expr"
o.foldexpr = "nvim_treesitter#foldexpr()"
o.foldenable = false
