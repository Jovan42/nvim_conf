# Neovim Keymaps

> Leader key: `<Space>`

---

## General

| Mode | Key | Action |
|------|-----|--------|
| n | `<Esc>` | Clear search highlights |
| n | `<C-s>` | Save file |
| n | `<C-c>` | Copy whole file to clipboard |
| n | `<leader>n` | Toggle line numbers |
| n | `<leader>rn` | Toggle relative line numbers |
| n | `<leader>b` | New buffer |
| n | `<leader>ch` | NvChad cheatsheet |
| n | `j` / `k` | Move through wrapped lines |
| n | `<Up>` / `<Down>` | Move through wrapped lines |
| v | `<` / `>` | Indent / dedent selection |

### Window Navigation

| Mode | Key | Action |
|------|-----|--------|
| n | `<C-h>` | Move to left window |
| n | `<C-l>` | Move to right window |
| n | `<C-j>` | Move to window below |
| n | `<C-k>` | Move to window above |

### Insert Mode Navigation

| Mode | Key | Action |
|------|-----|--------|
| i | `<C-b>` | Jump to beginning of line |
| i | `<C-e>` | Jump to end of line |
| i | `<C-h>` | Move left |
| i | `<C-l>` | Move right |
| i | `<C-j>` | Move down |
| i | `<C-k>` | Move up |

---

## Buffers

| Mode | Key | Action |
|------|-----|--------|
| n | `<Tab>` | Next buffer |
| n | `<S-Tab>` | Previous buffer |
| n | `<leader>x` | Close current buffer |

---

## LSP (all filetypes)

| Mode | Key | Action |
|------|-----|--------|
| n | `gD` | Go to declaration |
| n | `gd` | Go to definition |
| n | `gi` | Go to implementation |
| n | `gr` | Show references |
| n | `K` | Hover documentation |
| n | `<leader>ls` | Signature help |
| n | `<leader>D` | Type definition |
| n | `<leader>ra` | Rename (NvChad UI) |
| n | `<leader>ca` | Code action |
| n/v | `<leader>ca` | Code action (visual) |
| n | `<leader>fm` | Format file (async) |
| n | `<leader>lf` | Floating diagnostic |
| n | `[d` | Previous diagnostic |
| n | `]d` | Next diagnostic |
| n | `<leader>q` | Diagnostics to loclist |
| n | `<leader>wa` | Add workspace folder |
| n | `<leader>wr` | Remove workspace folder |
| n | `<leader>wl` | List workspace folders |

---

## File Explorer (nvim-tree)

| Mode | Key | Action |
|------|-----|--------|
| n | `<C-n>` | Toggle nvim-tree |
| n | `<leader>e` | Focus nvim-tree |

---

## Telescope

| Mode | Key | Action |
|------|-----|--------|
| n | `<leader>ff` | Find files |
| n | `<leader>fa` | Find all files (incl. hidden/ignored) |
| n | `<leader>fw` | Live grep |
| n | `<leader>fb` | Find open buffers |
| n | `<leader>fh` | Help tags |
| n | `<leader>fo` | Recently opened files |
| n | `<leader>fz` | Fuzzy find in current buffer |
| n | `<leader>ma` | Bookmarks / marks |
| n | `<leader>cm` | Git commits |
| n | `<leader>gt` | Git status |
| n | `<leader>pt` | Pick hidden terminal |
| n | `<leader>th` | Switch NvChad theme |

---

## Terminal (nvterm)

| Mode | Key | Action |
|------|-----|--------|
| n/t | `<A-i>` | Toggle floating terminal |
| n/t | `<A-h>` | Toggle horizontal terminal |
| n/t | `<A-v>` | Toggle vertical terminal |
| n | `<leader>h` | New horizontal terminal |
| n | `<leader>v` | New vertical terminal |
| t | `<C-x>` | Escape terminal mode |

---

## Git (gitsigns)

| Mode | Key | Action |
|------|-----|--------|
| n | `]c` | Next hunk |
| n | `[c` | Previous hunk |
| n | `<leader>rh` | Reset hunk |
| n | `<leader>ph` | Preview hunk |
| n | `<leader>gb` | Blame line |
| n | `<leader>td` | Toggle deleted lines |
| n | `<leader>cm` | Git commits (Telescope) |
| n | `<leader>gt` | Git status (Telescope) |

### LazyGit

| Mode | Key | Action |
|------|-----|--------|
| n | `<leader>lg` | Open LazyGit |

---

## Comments

| Mode | Key | Action |
|------|-----|--------|
| n | `<leader>/` | Toggle line comment |
| v | `<leader>/` | Toggle comment (selection) |

---

## Which-Key

| Mode | Key | Action |
|------|-----|--------|
| n | `<leader>wK` | Show all keymaps |
| n | `<leader>wk` | Query keymap lookup |

---

## Indent Blankline

| Mode | Key | Action |
|------|-----|--------|
| n | `<leader>cc` | Jump to current indentation context |

---

## Database (vim-dadbod-ui)

| Mode | Key | Action |
|------|-----|--------|
| n | `:DBUI` | Open database UI |
| n | `:DBUIToggle` | Toggle database UI |
| n | `:DBUIAddConnection` | Add DB connection |
| n | `:DBUIFindBuffer` | Find DB buffer |

---

## Java (ftplugin — only in `.java` files)

| Mode | Key | Action |
|------|-----|--------|
| n | `<leader>gf` | Format buffer |
| n | `<leader>oi` | Organize imports |
| n | `<leader>ev` | Extract variable |
| n | `<leader>em` | Extract method |

> Generic LSP keys (`gd`, `K`, `gr`, etc.) are inherited from the LSP section above.

---

## Rust (ftplugin — only in `.rs` files)

| Mode | Key | Action |
|------|-----|--------|
| n | `<leader>Cr` | `cargo run` in a split terminal |
