return {
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({
        check_ts = true, -- treesitter integration
      })
    end,
  },
}
