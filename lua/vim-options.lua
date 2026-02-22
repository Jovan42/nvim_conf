vim.cmd("set colorcolumn=120")

-- Compatibility shim: some plugins still call the deprecated vim.lsp.get_active_clients.
-- Remove once all plugins have updated to vim.lsp.get_clients.
vim.lsp.get_active_clients = vim.lsp.get_clients
