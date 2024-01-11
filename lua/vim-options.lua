vim.api.nvim_set_keymap('n', '<leader>Cr', ':belowright split term://cargo run<CR>:resize 10<CR>',
    { noremap = true, silent = true })
vim.cmd("set colorcolumn=120")
