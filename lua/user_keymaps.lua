local options = { noremap = true }

-- Goes back to normal mode by pressing j followed by k
vim.keymap.set("i", "jk", "<esc>", options)

-- Split new line by Ctrl+J. Note that Shift+J already merges two lines
vim.keymap.set("n", "<nl>", "i<cr><esc>", options)

-- Toggle Aerial (code outline)
vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>", { desc = "Open/close code outline" })

-- Move back and forth between buffers with Ctr+n and Ctrl+p
vim.keymap.set("n", "]b", ":bnext<CR>", { desc = "Go to next buffer" })
vim.keymap.set("n", "[b", ":bprevious<CR>", { desc = "Go to previous buffer" })
