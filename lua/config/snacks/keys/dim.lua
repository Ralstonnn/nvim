return {
  {
    "<leader>ide",
    function()
      Snacks.dim.enable()
    end,
    desc = "Snacks dim enable",
  },
  {
    "<leader>idd",
    function()
      Snacks.dim.disable()
    end,
    desc = "Snacks dim disable",
  },
}
