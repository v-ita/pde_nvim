local cs = vim.g.colorscheme
local status, _ = pcall(vim.cmd, 'colorscheme ' .. cs )

if not status then
	vim.notify('colorscheme ' .. cs .. ' not found')
	vim.cmd [[ colorscheme default ]]
end
