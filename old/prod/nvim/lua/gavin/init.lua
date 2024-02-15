local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require ('gavin.lazy')
require ('gavin.colors')
require ('gavin.remap')
require ('gavin.set')

-- nvim-tree is also there in modified buffers so this function filter it out
local modifiedBufs = function(bufs)
    local t = 0
    for k,v in pairs(bufs) do
        if v.name:match("NvimTree_") == nil then
            t = t + 1
        end
    end
    return t
end

--vim.api.nvim_create_autocmd("BufEnter", {
--  group = vim.api.nvim_create_augroup("NvimTreeClose", {clear = true}),
--  pattern = "NvimTree_*",
--  callback = function()
--    local layout = vim.api.nvim_call_function("winlayout", {})
--    if layout[1] == "leaf" and vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(layout[2]), "filetype") == "NvimTree" and layout[3] == nil then vim.cmd("confirm quit") end
--  end
--})

pcall(vim.cmd, 'MasonUpdate')
