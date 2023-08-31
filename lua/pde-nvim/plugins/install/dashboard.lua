local M = { vim.g.git_username .. '/dashboard-nvim' }

M.event = 'VimEnter'

M.config = function ()
	local status, dashboard = pcall(require, 'dashboard')
	if not status then return end

	dashboard.setup {
		config = {
			packages = {
				enable = true
			},
			mru = { limit = 10, icon = '  ', label = 'Recent files                                                 ', },
			shortcut = {
				{
                	desc = ' Explorer',
                	group = 'DashboardShortCut',
                	key = 'e',
                	action = 'NvimTreeToggle'
            	}, {
                	desc = '  Find files',
                	group = 'DashboardShortCut',
                	key = 'f',
                	action = 'Telescope find_files'
            	}, {
                	desc = '  Plugin sync',
                	group = 'DashboardShortCut',
                	key = 'u',
                	action = 'Lazy sync'
            	}, {
                	desc = '  Quit',
                	group = 'DashboardShortCut',
                	key = 'q',
                	action = 'qa'
            	} },
            footer = { '', '', '  My personal development environment  ', '', '    󰡄          ' }
		}
	}
end

return M

-- https://github.com/glepnir/dashboard-nvim
