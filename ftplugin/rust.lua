-- Rust-specific keymaps (buffer-local)
vim.keymap.set('n', '<leader>Cr', ':belowright split term://cargo run<CR>:resize 10<CR>',
  { buffer = true, noremap = true, silent = true, desc = 'Cargo run' })
