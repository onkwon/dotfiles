vim.cmd("set tabstop=8")
vim.cmd("set softtabstop=8")
vim.cmd("set shiftwidth=8")

vim.g.mapleader = ","
vim.g.background = "light"

vim.opt.expandtab = false
vim.opt.colorcolumn = "80"
vim.opt.relativenumber = true
vim.opt.scrolloff = 0
vim.opt.signcolumn = "yes"
vim.opt.wrap = true
vim.opt.showmode = false
vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.undodir = vim.fn.stdpath('config') .. '/undodir'
vim.opt.undofile = true

-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.wo.number = true

function _G.set_terminal_keymaps()
  local opts = {noremap = true}
  vim.api.nvim_buf_set_keymap(0, 't', '<leader>q', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank { higroup = "Visual", timeout = 200 }
  end,
})
