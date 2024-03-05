vim.g.mapleader = " "
vim.keymap.set("n", "<leader>ef", vim.cmd.NvimTreeToggle)

vim.keymap.set("v","J", ":m '>+1<CR> gv")
vim.keymap.set("v","K", ":m '<-2<CR> gv")

vim.keymap.set("n","J","mzJ`z")
vim.keymap.set("n","<C-d>","<C-d>z.")
vim.keymap.set("n","<C-u>","<C-u>z.")

vim.keymap.set("n","n","nzzzv")
vim.keymap.set("n","N","Nzzzv")

vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n","<leader>P",":! git commit -a -m 'update'<CR> :! git push <CR>")

vim.keymap.set("n","<C-Y>", ":! less ~/.config/nvim/lua/gavin/remap.lua<cr>")

-- vim tmux navigator config
vim.keymap.set("n","<C-h>", "<cmd> TmuxNavigateLeft<cr>")
vim.keymap.set("n","<C-j>", "<cmd> TmuxNavigateDown<cr>")
vim.keymap.set("n","<C-k>", "<cmd> TmuxNavigateUp<cr>")
vim.keymap.set("n","<C-l>", "<cmd> TmuxNavigateRight<cr>")

-- harpoon config
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n","<leader>a", mark.add_file)
vim.keymap.set("n","<leader>s", ui.toggle_quick_menu)

vim.keymap.set("n","<leader>7", function() ui.nav_file(1) end)
vim.keymap.set("n","<leader>8", function() ui.nav_file(2) end)
vim.keymap.set("n","<leader>9", function() ui.nav_file(3) end)
vim.keymap.set("n","<leader>0", function() ui.nav_file(4) end)

-- lsp config
local lsp = require('lsp-zero')

lsp.on_attach(function(client, bufnr)
    local cmp = require('cmp')
    cmp.setup({
        cmp_mappings = lsp.defaults.cmp_mappings({
            ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
            ['<C-i>'] = cmp.mapping.select_next_item(cmp_select),
            ['<C-y>'] = cmp.mapping.complete(),
            --['<C-Space>'] = cmp.mapping.complete(),
        }),
        formatting = lsp.cmp_format(),
    })
end)


require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {'pylsp', 'clangd'},
    handlers = {
        lsp.default_setup,
        pylsp = function()
            require('lspconfig').pylsp.setup({
                settings = {
                    pylsp = {
                        plugins = {
                            pycodestyle = {
                                ignore = {'W391', 'E265'},
                                maxLineLength = 120
                            }
                        }
                    }
                }
            })
        end,
        clangd = function()
            require('lspconfig').clangd.setup({})
        end,
    },
})


--lsp.setup()

-- telescope config
--local builtin = require('telescope.builtin')
--vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
--vim.keymap.set('n', '<leader>pg', builtin.git_files, {})


--vim.keymap.set('n', '<leader>fg', function() builtin.grep_string({search = vim.fn.input("Grep > ") } )
--end)

-- treesitter config
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = {"javascript", "python", "rust", "c", "lua"},

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    enable = true,
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

-- undotree config
vim.keymap.set("n","<leader>u", vim.cmd.UndotreeToggle)



