return {
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT'
			},
			diagnostics = {
				globals = { 'vim', 'pcall', 'require' }
			}
		}
	}
}
