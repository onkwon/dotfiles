return {
  "akinsho/toggleterm.nvim",
  config = function()
    local tt = require("toggleterm")
    tt.setup({
      size = f10,
      open_mapping = [[<leader>e]],
      hide_numbers = true,
      shade_terminals = true,
      --shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = "horizontal",
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
      	border = "curved",
      },
    })

    local Terminal = require("toggleterm.terminal").Terminal
    local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
    local htop = Terminal:new({cmd = "htop", hidden = true, direction = "float"})

    function _LAZYGIT_TOGGLE()
      lazygit:toggle()
    end

    function _HTOP_TOGGLE()
      htop:toggle()
    end

    vim.keymap.set("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", {})
    vim.keymap.set("n", "<leader>gt", "<cmd>lua _HTOP_TOGGLE()<CR>", {})

  end,
}
