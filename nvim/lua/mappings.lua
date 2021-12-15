-- maps.lua

local map = vim.api.nvim_set_keymap
local g = vim.g

-- map the leader key
-- Leader is Space as always
map("n", "<Space>", "", {})
vim.g.mapleader = " " -- 'vim.g' sets global variables

local options = {noremap = true}

-- Writing
map("n", "<leader>w", ":w<CR>", options)
map("n", "<leader>q", ":q<CR>", options)
map("i", "jj", "<ESC>", options)

-- Search
map("n", "<leader><esc>", ":nohlsearch<CR>", options)

-- Buffers
map("n", "<Tab>", ":bnext<CR>", options)
map("n", "<S-Tab>", ":bprev<CR>", options)
map("n", "<Leader>b", ":BufDel<CR>", options)

-- Splits
map("n", "<Leader>v", ":vnew<CR>", options)
map("n", "<Leader><Down>", "<C-W><C-J>", {silent = true})
map("n", "<Leader><Up>", "<C-W><C-K>", {silent = true})
map("n", "<Leader><Right>", ":vnew<CR>", {silent = true})
map("n", "<Leader><Left>", "<C-W><C-H>", {silent = true})

-- Fast Reload of the settings
map("n", "<leader>r", ":source ~/.config/nvim/init.lua<CR>", options)
