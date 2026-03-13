-- ~/.config/nvim/lua/plugins/undotree.lua
return {
  "jiaoshijie/undotree",
  dependencies = "nvim-lua/plenary.nvim",
  opts = {
    -- false = split preview window instead of floating preview
    -- this usually feels closer to a "real diff pane" workflow
    float_diff = false,

    -- available: "left_bottom" | "left_left_bottom"
    -- left_left_bottom = undotree on the left, diff preview below/right layout
    layout = "left_bottom",

    -- place tree on left side
    position = "left",

    window = {
      width = 0.15,
      height = 0.2,
      border = "rounded",
    },
  },
  keys = {
    { "<leader>u", function() require("undotree").toggle() end, desc = "Toggle UndoTree" },
  },
}
