local gu = vim.g.git_username

local helpers_status, helpers = pcall(require, vim.g.namespace .. '.helpers')
if not helpers_status then return end

local map = helpers.map

local M = { gu .. '/nvim-cmp' }

M.dependencies = {
	{ gu .. '/cmp-nvim-lsp' },
	{ gu .. '/cmp-nvim-lua' },
	{ gu .. '/cmp-buffer' },
	{ gu .. '/LuaSnip' },
	{
		gu .. '/friendly-snippets',
		config = function()
			require('luasnip.loaders.from_vscode').lazy_load()
		end
	},
	{ gu .. '/cmp_luasnip' }
}

M.config = function()
	local cmp_status, cmp = pcall(require, 'cmp')
	if not cmp_status then return end

	local setup = {}

	setup.mapping = cmp.mapping.preset.insert({
		['<c-d>'] = cmp.mapping.scroll_docs(-4),
		['<c-f>'] = cmp.mapping.scroll_docs(4),
		['<c-Space>'] = cmp.mapping.complete(),
		['<c-e>'] = cmp.mapping {
			i = cmp.mapping.abort(),
			c = cmp.mapping.close()
		},
		['<cr>'] = cmp.mapping.confirm({
			select = true,
			behavior = cmp.ConfirmBehavior.Replace
		})
	})

	local f_menu = {}
	for key, value in pairs({
		nvim_lsp = 'lsp',
		nvim_lua = 'api',
		luasnip = 'snippet',
		buffer = 'buffer',
	}) do
		local spc = string.rep(' ', 7 - string.len(value))
		f_menu[key] = spc .. value
	end

	local sources = {
		{ name = 'nvim_lsp' },
		{ name = 'nvim_lua' },
		{ name = 'luasnip' },
		{ name = 'buffer' },
	}

	local snip_status, luasnip = pcall(require, 'luasnip')
	if snip_status then
		setup.snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end
		}

		luasnip.config.set_config {
			history = true,
			enable_autosnippets = true
		}

		map({ 'i', 's' }, '<c-n>', "<cmd>lua require'luasnip'.jump(1)<cr>", { desc = 'Snippet jump next' })
		map({ 'i', 's' }, '<c-p>', "<cmd>lua require'luasnip'.jump(-1)<cr>", { desc = 'Snippet jump previous' })
	end

	setup.formatting = {
		fields = { 'abbr', 'kind', 'menu' },
		format = function(entry, vim_item)
			vim_item.kind = ' '
			vim_item.menu = (f_menu)[entry.source.name]
			return vim_item
		end
	}

	setup.confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = false
	}

	setup.window = {
		documentation = cmp.config.window.bordered()
	}

	setup.sources = cmp.config.sources(sources)

	cmp.setup(setup)
end

return M

-- https://github.com/hrsh7th/nvim-cmp
-- https://github.com/hrsh7th/cmp-buffer
-- https://github.com/hrsh7th/cmp-nvim-lua
-- https://github.com/hrsh7th/cmp-nvim-lsp
-- https://github.com/saadparwaiz1/cmp_luasnip
