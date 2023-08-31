--[[
-- MAPS
--]]

-- Modes
--   n : normal
--   i : insert
--   v : visual
--   x : visual block
--   t : term
--   c : command

local ns = vim.g.namespace

local status, helpers = pcall(require, ns .. '.helpers')
if not status then return end

local map = helpers.map

-- remap space as leaker key
map('', '<space>', '<nop>', { desc = 'Unmap space' })

-- window navigation
map('n', '<c-w>', '<c-w>w', { desc = 'Change focused window to the next' })

-- buffer
map('n', '<leader>w', '<cmd>w<cr>', { desc = 'Save buffer' })
map('n', '<leader>qq', '<cmd>bdelete<cr>', { desc = 'Quit buffer' })
map('n', '<leader>qa', '<cmd>qa<cr>', { desc = 'Quit all buffers' })

-- press jk fast to exit insert mode
map('i', 'jk', '<esc>', { desc = 'Exit insert mode' })

-- swap two lines
map('n', '<c-k>', ':m-2<cr>', { desc = 'Move line up' })
map('n', '<c-j>', ':m+1<cr>', { desc = 'Move line down' })

-- window split
map('n', '<leader>sh', ':split<cr><c-w>w', { desc = 'Split horizontally' })
map('n', '<leader>sv', ':vsplit<cr><c-w>w', { desc = 'Split vertically' })

-- window resize
map('n', '<c-up>', ':resize +2<cr>', { desc = 'Enlarge height' })
map('n', '<c-down>', ':resize -2<cr>', { desc = 'Reduce height' })
map('n', '<c-left>', ':vertical resize -2<cr>', { desc = 'Reduce width' })
map('n', '<c-right>', ':vertical resize +2<cr>', { desc = 'Enlarge width' })

-- selection
map('n', '<c-a>', 'gg<s-v>G', { desc = 'Select all' })

-- highlight
map('n', '<leader>h', ':noh<cr>', { desc = 'Disable highlight' })

-- easy insertion of a trailing ; or , from insert mode
map('i', ';;', '<esc>A;<esc>', { desc = 'Add ;; at the end of line' })
map('i', ',,', '<esc>A,<esc>', { desc = 'Add , at the end of line' })
