-- Format on save can be setup for all LSP servers 
vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format() ]])
