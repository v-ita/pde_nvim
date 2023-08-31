local M = {}

local signs = { Error = 'E', Warn = 'W', Hint = 'H', Info = 'I' }
for type, icon in pairs(signs) do
	local hl = 'DiagnosticSign' .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

M.on_attach = function(_, bnfr)
	local helpers_status, helpers = pcall(require, vim.g.namespace .. '.helpers')

	if helpers_status then
		local map = helpers.map

		map('n', '<leader>lr', vim.lsp.buf.rename, { desc = 'LSP Rename', buffer = bnfr })
		map('n', '<leader>lf', function() vim.lsp.buf.format { async = true } end, { desc = 'Format', buffer = bnfr })
		map('n', '<leader>lh', vim.lsp.buf.hover, { desc = 'LSP Hover documentation', buffer = bnfr })
		map('n', '<leader>lo', require('telescope.builtin').lsp_definitions, { desc = 'Go to definition', buffer = bnfr })
		map('n', '<leader>lg', require('telescope.builtin').diagnostics, { desc = 'Diagnostics', buffer = bnfr })
		map('n', '<leader>lx', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic', buffer = bnfr })
		map('n', '<leader>lv', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic', buffer = bnfr })
	end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

M.capabilities = capabilities

return M
