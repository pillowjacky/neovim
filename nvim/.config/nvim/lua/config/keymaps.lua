local map = vim.keymap.set

-- buffer
map("n", "<leader>bp", "<cmd>bprevious<CR>", { desc = "Prev buffer" })
map("n", "<leader>bn", "<cmd>bnext<CR>", { desc = "Next buffer" })

-- indentation
map("v", "<", "<gv")
map("v", ">", ">gv")

-- search
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- window
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })
