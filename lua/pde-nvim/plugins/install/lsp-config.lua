local ns = vim.g.namespace
local gu = vim.g.git_username

local M = { gu .. '/nvim-lspconfig' }

M.config = function()
	local lsp_status, lspconfig = pcall(require, 'lspconfig')
	if not lsp_status then return end

	local servers_status, servers = pcall(require, ns .. '.plugins.lsp.servers')
	if not servers_status then return end

	local handlers_status, handlers = pcall(require, ns .. '.plugins.lsp.handlers')
	if not handlers_status then return end

	for _, server in ipairs(servers) do
		local settings = {}
		local settings_status, setting_opt = pcall(require, ns .. '.plugins.lsp.setup.' .. server)
		if settings_status then
			settings = setting_opt.settings
		end

		lspconfig[server].setup {
			on_attach = handlers.on_attach,
			capabilities = handlers.capabilities,
			settings = settings
		}
	end
end

return M

-- https://github.com/neovim/nvim-lspconfig
