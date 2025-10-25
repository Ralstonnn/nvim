local function recording()
  local rec = vim.fn.reg_recording()
  if rec ~= "" then
    return "⏺ @" .. rec
  end
  return ""
end

-- Simple and easy statusline.
--  You could remove this setup call if you don't like it,
--  and try some other statusline plugin
local statusline = require('mini.statusline')

-- set use_icons to true if you have a Nerd Font
statusline.setup({
  content = {
    active = function ()
      local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
      local git           = MiniStatusline.section_git({ trunc_width = 40 })
      local diff          = MiniStatusline.section_diff({ trunc_width = 75 })
      local diagnostics   = MiniStatusline.section_diagnostics({ trunc_width = 75 })
      local lsp           = MiniStatusline.section_lsp({ trunc_width = 75 })
      local filename      = MiniStatusline.section_filename({ trunc_width = 140 })
      local fileinfo      = MiniStatusline.section_fileinfo({ trunc_width = 120 })
      -- local location      = MiniStatusline.section_location({ trunc_width = 75 })
      local location      = '%2l:%-2v'
      local search        = MiniStatusline.section_searchcount({ trunc_width = 75 })
      local macro         = recording()

      return MiniStatusline.combine_groups({
        { hl = mode_hl,                    strings = { mode } },
        { hl = 'MiniStatuslineDevinfo',    strings = { git, diff, diagnostics, lsp } },
        '%<', -- Mark general truncate point
        { hl = 'MiniStatuslineFilename',   strings = { filename } },
        '%=', -- End left alignment
        { hl = 'MiniStatuslineModeOther',  strings = { macro } },
        { hl = 'MiniStatuslineFileinfo',   strings = { fileinfo } },
        { hl = mode_hl,                    strings = { search, location } },
      })
    end,
  },
  use_icons = vim.g.have_ned_font,
})

-- Autocommand to update statusline on macro recording
vim.api.nvim_create_autocmd({ "RecordingEnter", "RecordingLeave" }, {
  callback = function()
    vim.defer_fn(function()
      vim.cmd("redrawstatus")
    end, 50)
  end,
})

