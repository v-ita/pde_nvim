local gu = vim.g.git_username

local M = { gu .. '/mason.nvim' }

M.dependencies = {
	{ gu .. '/mason-lspconfig.nvim' },
	{ gu .. '/mason-null-ls.nvim' },
	{ gu .. '/null-ls.nvim' }
}

M.config = function()
	local servers_status, servers = pcall(require, vim.g.namespace .. '.plugins.lsp.servers')
	if not servers_status then return end

	local mason_status, mason = pcall(require, 'mason')
	if not mason_status then return end

	mason.setup {}

	local null_ls_status, null_ls = pcall(require, 'null-ls')
	if not null_ls_status then return end

	local mason_lsp_status, mason_lsp = pcall(require, 'mason-lspconfig')
	if not mason_lsp_status then return end
	mason_lsp.setup {
		ensure_installed = servers,
		automatic_installation = true
	}

	local formatting = null_ls.builtins.formatting
	null_ls.setup {
		sources = {
			formatting.prettier
		}
	}

	local mason_null_ls_status, mason_null_ls = pcall(require, 'mason-null-ls')
	if not mason_null_ls_status then return end
	mason_null_ls.setup {
		ensure_installed = {
			'prettier'
		}
	}
end

return M

-- https://github.com/williamboman/mason.nvim
-- https://github.com/williamboman/mason-lspconfig.nvim
