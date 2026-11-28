local function copyTaskName()
  local branchName = vim.trim(vim.fn.system("git branch --show-current"))

  if vim.v.shell_error ~= 0 or branchName == "" then
    Snacks.notify.warn("Could not read the current git branch (not a repository or detached HEAD)")
    return
  end

  -- Get name after the last "/" (e.g. "feature/TASK-123" -> "TASK-123")
  local taskName = branchName:match("([^/]+)$") or branchName
  vim.fn.setreg("+", taskName) -- Put string to + register (clipboard)

  Snacks.notify.info('Task name was copied to clipboard "' .. taskName .. '"')
end

return {
  copyTaskName = copyTaskName,
}
