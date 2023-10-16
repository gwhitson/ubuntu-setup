vim.g.mapleader = " "
vim.keymap.set("n", "<leader>ef", vim.cmd.Ex)

vim.keymap.set("v","J", ":m '>+1<CR> gv")
vim.keymap.set("v","K", ":m '<-2<CR> gv")

vim.keymap.set("n","J","mzJ`z")
vim.keymap.set("n","<C-d>","<C-d>zz")
vim.keymap.set("n","<C-u>","<C-u>zz")

vim.keymap.set("n","n","nzzzv")
vim.keymap.set("n","N","Nzzzv")

vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n","<leader>P",":! git commit -a -m 'update'<CR> :! git push <CR>")

vim.keymap.set("n","<C-Y>", ":! cat ~/.nvimRemaps<CR>")

--[[
HARPOON KEYBINDS
vim.keymap.set("n","<leader>a", mark.add_file)
vim.keymap.set("n","<leader>s", ui.toggle_quick_menu)

vim.keymap.set("n","<C-h>", function() ui.nav_file(1) end)
vim.keymap.set("n","<C-j>", function() ui.nav_file(2) end)
vim.keymap.set("n","<C-k>", function() ui.nav_file(3) end)
vim.keymap.set("n","<C-l>", function() ui.nav_file(4) end)

LSP KEYBINDS
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-i>'] = cmp.mapping.select_next_item(cmp_select),
	['<C-y>'] = cmp.mapping.confirm({ select = true }),
	['<C-Space>'] = cmp.mapping.complete()

TELESCOPE KEYBINDS
vim.keymap.set('n', '<leader>pv', builtin.find_files, {})
vim.keymap.set('n', '<leader><C-g>', builtin.git_files, {})
vim.keymap.set('n', '<leader>fg', function() builtin.grep_string({search = vim.fn.input("Grep > ") } )

UNDOTREE
vim.keymap.set("n","<leader>u", vim.cmd.UndotreeToggle)
--]]
