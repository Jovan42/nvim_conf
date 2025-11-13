dofile(vim.g.base46_cache .. "lsp")
require "nvchad.lsp"

local M = {}
local utils = require "core.utils"

-- export on_attach & capabilities for custom lspconfigs

M.on_attach = function(client, bufnr)
    utils.load_mappings("lspconfig", { buffer = bufnr })

    if client.server_capabilities.signatureHelpProvider then
        require("nvchad.signature").setup(client)
    end

    if not utils.load_config().ui.lsp_semantic_tokens and client.supports_method "textDocument/semanticTokens" then
        client.server_capabilities.semanticTokensProvider = nil
    end
end

M.capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Configure lua_ls using new vim.lsp.config API
vim.lsp.config('lua_ls', {
    cmd = { 'lua-language-server' },
    root_markers = { '.luarc.json', '.luarc.jsonc', '.luacheckrc', '.stylua.toml', 'stylua.toml', 'selene.toml', 'selene.yml', '.git' },
    filetypes = { 'lua' },
    on_attach = M.on_attach,
    capabilities = M.capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = {
                    [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                    [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
                    [vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types"] = true,
                    [vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy"] = true,
                },
                maxPreload = 100000,
                preloadFileSize = 10000,
            },
        },
    },
})

-- Configure gopls using new vim.lsp.config API
vim.lsp.config('gopls', {
    cmd = { 'gopls' },
    root_markers = { 'go.work', 'go.mod', '.git' },
    filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
    on_attach = M.on_attach,
    capabilities = M.capabilities,
    settings = {
        gopls = {
            completeUnimported = true,
            usePlaceholders = true,
            analyses = {
                unusedparam = true,
            }
        }
    }
})

-- Configure terraform-ls using new vim.lsp.config API
vim.lsp.config('terraformls', {
    cmd = { 'terraform-ls', 'serve' },
    root_markers = { '.terraform', '.git' },
    filetypes = { 'terraform', 'tf' },
    on_attach = M.on_attach,
    capabilities = M.capabilities,
})

-- Enable the LSP servers
vim.lsp.enable('lua_ls')
vim.lsp.enable('gopls')
vim.lsp.enable('terraformls')

vim.filetype.add({
  extension = {
    tf = "terraform"
  }
})
return M
