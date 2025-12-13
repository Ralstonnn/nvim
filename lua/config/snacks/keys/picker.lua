return {
  -- git
  {
    "<leader>g/b",
    function()
      Snacks.picker.git_branches()
    end,
    desc = "Git Branches",
  },
  {
    "<leader>g/l",
    function()
      Snacks.picker.git_log()
    end,
    desc = "Git Log",
  },
  {
    "<leader>g/L",
    function()
      Snacks.picker.git_log_line()
    end,
    desc = "Git Log Line",
  },
  {
    "<leader>g/s",
    function()
      Snacks.picker.git_status()
    end,
    desc = "Git Status",
  },
  {
    "<leader>g/S",
    function()
      Snacks.picker.git_stash()
    end,
    desc = "Git Stash",
  },
  {
    "<leader>g/d",
    function()
      Snacks.picker.git_diff()
    end,
    desc = "Git Diff (Hunks)",
  },
  {
    "<leader>g/f",
    function()
      Snacks.picker.git_log_file()
    end,
    desc = "Git Log File",
  },
  -- search
  {
    "<leader>/",
    function()
      Snacks.picker.lines()
    end,
    desc = "Buffer Lines",
  },
  {
    "<leader>s/",
    function()
      Snacks.picker.grep_buffers()
    end,
    desc = "Grep Open Buffers",
  },
  {
    "<leader><leader>",
    function()
      Snacks.picker.buffers()
    end,
    desc = "Buffers",
  },
  {
    "<leader>sg",
    function()
      Snacks.picker.grep()
    end,
    desc = "Grep",
  },
  {
    "<leader>sw",
    function()
      Snacks.picker.grep_word()
    end,
    desc = "Visual selection or word",
    mode = { "n", "x" },
  },
  {
    "<leader>s.",
    function()
      Snacks.picker.recent()
    end,
    desc = "Recent",
  },
  {
    "<leader>sf",
    function()
      Snacks.picker.smart()
    end,
    desc = "Find Files",
  },
  {
    "<leader>sn",
    function()
      Snacks.picker.notifications()
    end,
    desc = "Notification History",
  },
  {
    '<leader>s"',
    function()
      Snacks.picker.registers()
    end,
    desc = "Registers",
  },
  {
    "<leader>se",
    function()
      Snacks.picker.diagnostics_buffer()
    end,
    desc = "Buffer Diagnostics",
  },
  {
    "<leader>sh",
    function()
      Snacks.picker.help()
    end,
    desc = "Help Pages",
  },
  {
    "<leader>sH",
    function()
      Snacks.picker.highlights()
    end,
    desc = "Highlights",
  },
  {
    "<leader>sj",
    function()
      Snacks.picker.jumps()
    end,
    desc = "Jumps",
  },
  {
    "<leader>sk",
    function()
      Snacks.picker.keymaps()
    end,
    desc = "Keymaps",
  },
  {
    "<leader>sl",
    function()
      Snacks.picker.loclist()
    end,
    desc = "Location List",
  },
  {
    "<leader>sm",
    function()
      Snacks.picker.marks()
    end,
    desc = "Marks",
  },
  {
    "<leader>sM",
    function()
      Snacks.picker.man()
    end,
    desc = "Man Pages",
  },
  {
    "<leader>sq",
    function()
      Snacks.picker.qflist()
    end,
    desc = "Quickfix List",
  },
  {
    "<leader>sr",
    function()
      Snacks.picker.resume()
    end,
    desc = "Resume",
  },
  {
    "<leader>su",
    function()
      Snacks.picker.undo()
    end,
    desc = "Undo History",
  },
  -- LSP
  {
    "gd",
    function()
      Snacks.picker.lsp_definitions()
    end,
    desc = "Goto Definition",
  },
  {
    "gD",
    function()
      Snacks.picker.lsp_declarations()
    end,
    desc = "Goto Declaration",
  },
  {
    "gr",
    function()
      Snacks.picker.lsp_references()
    end,
    nowait = true,
    desc = "References",
  },
  {
    "gI",
    function()
      Snacks.picker.lsp_implementations()
    end,
    desc = "Goto Implementation",
  },
  {
    "gy",
    function()
      Snacks.picker.lsp_type_definitions()
    end,
    desc = "Goto T[y]pe Definition",
  },
  {
    "gai",
    function()
      Snacks.picker.lsp_incoming_calls()
    end,
    desc = "C[a]lls Incoming",
  },
  {
    "gao",
    function()
      Snacks.picker.lsp_outgoing_calls()
    end,
    desc = "C[a]lls Outgoing",
  },
  {
    "<leader>ss",
    function()
      Snacks.picker.lsp_symbols()
    end,
    desc = "LSP Symbols",
  },
  {
    "<leader>sS",
    function()
      Snacks.picker.lsp_workspace_symbols()
    end,
    desc = "LSP Workspace Symbols",
  },
}
