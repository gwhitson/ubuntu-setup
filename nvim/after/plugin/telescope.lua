local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pv', builtin.find_files, {})
vim.keymap.set('n', '<leader><C-g>', builtin.git_files, {})


vim.keymap.set('n', '<leader>fg', function() builtin.grep_string({search = vim.fn.input("Grep > ") } )
end)
