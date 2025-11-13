local M = {}

M.dap = {
    plugin = true,
    n = {
        ["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>" },
        ["<leader>dus"] = {
            function()
                local widgets = require('dap.ui.widgets');
                local sidebar = widgets.sidebar(widgets.scopes);
                sidebar.open();
            end,
            "Open debugging sidebar"
        }
    }
}

M.crates = {
    plugin = true,
    n = {
        ["<leader>rcu"] = {
            function()
                require('crates').upgrade_all_crates()
            end,
            "update crates"
        }
    }
}

M.custom = {

    n= {

        ["<leader>mdp"] = {
            function ()
                vim.cmd('set filetype=markdown')
                vim.cmd('MarkdownPreview')
            end,
            "set markdown and preview"
        },

        ["<leader>Cr"] = {
            function()
                vim.cmd('belowright split term://cargo run')
                vim.cmd('resize 10')
            end,
            "Run cargo in terminal split"
        },

        -- Git blame toggle
        ["<leader>gb"] = { "<cmd>BlameToggle<CR>", "Toggle git blame" },

        -- Telescope undo
        ["<leader>u"] = { "<cmd>Telescope undo<CR>", "Telescope undo history" },

        -- DAP UI toggle
        ["<leader>dt"] = {
            function()
                require('dapui').toggle()
            end,
            "Toggle DAP UI"
        },

        -- Format current buffer manually
        ["<leader>fm"] = {
            function()
                require('conform').format()
            end,
            "Format buffer"
        }
    }
}

M.go_debug = {
    plugin = true,
    n = {
        ["<leader>dgt"] = {
            function()
                require('dap-go').debug_test()
            end,
            "Debug Go test"
        },
        ["<leader>dgl"] = {
            function()
                require('dap-go').debug_last_test()
            end,
            "Debug last Go test"
        }
    }
}
return M
