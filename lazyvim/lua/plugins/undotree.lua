return {
  "jiaoshijie/undotree",
  dependencies = "nvim-lua/plenary.nvim",
  config = true,
  keys = { -- load the plugin only when using it's keybinding:
    {
      "<leader>t",
      function()
        require("undotree").toggle()
      end,
      desc = "Toggle undotree",
    },
  },
}
