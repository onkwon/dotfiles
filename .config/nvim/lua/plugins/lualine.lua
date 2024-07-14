return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require('lualine').setup({
      options = {
        theme = 'dracula'
      },
  sections = {
    lualine_c = {
      {
        "filename",
        file_status = true,
        path = 1
      }
    }, -- 0: just filename, 1: relative path, 2: absolute path
  },
  inactive_sections = {
    lualine_c = { { "filename", file_status = true, path = 1 } },
    lualine_x = { "location" },
  },
    })
  end
}
