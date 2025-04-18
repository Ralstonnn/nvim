local function load_all_templates_from(dir)
  local scan = require("plenary.scandir")
  local overseer = require("overseer")

  for _, file in ipairs(scan.scan_dir(dir, { depth = 1, add_dirs = false })) do
    if file:match("%.lua$") then
      local ok, tpl = pcall(loadfile, file)
      if ok and tpl then
        local template = tpl()
        if template and type(template) == "table" then
          overseer.register_template(template)
        end
      end
    end
  end
end

return {
  "stevearc/overseer.nvim",
  dependencies = {
    -- NOTE: Needed to load local templates if will be loaded other way then remove the dependency
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local overseer = require("overseer")

    vim.keymap.set("n", "<leader>or", overseer.run_template, { desc = "[O]verseer [R]un" })
    vim.keymap.set("n", "<leader>ot", overseer.toggle, { desc = "[O]verseer [T]oggle" })

    overseer.setup()

    -- Load project-specific templates after setup
    local local_template_dir = vim.fn.getcwd() .. "/.nvim/templates"
    if vim.fn.isdirectory(local_template_dir) == 1 then
      load_all_templates_from(local_template_dir)
    end
  end,
}
