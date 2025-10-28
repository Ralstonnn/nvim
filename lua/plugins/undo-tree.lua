return {
  {
    "mbbill/undotree",
    keys = {
      {
        "<leader><F5>",
        function()
          vim.cmd.UndotreeToggle()
          vim.cmd.UndotreeFocus()
        end,
        desc = "Undo Tree"
      }
    }
  },
}
