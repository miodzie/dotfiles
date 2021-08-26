" Auto-format *.go files prior to saving them
autocmd BufWritePre *.go lua vim.lsp.buf.formatting_sync(nil, 1000)
