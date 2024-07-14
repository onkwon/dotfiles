return {
  "kkoomen/vim-doge",
  config = function()
    vim.keymap.set('n', '<Leader>d', '<Plug>(doge-generate)', {})
  end,
}
