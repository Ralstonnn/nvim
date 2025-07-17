local function copyTaskName()
  local branchName = vim.fn.system("git branch --show-current")

  local taskName = branchName:match("([^/]+)$"):gsub("\n", "") -- Get name after / and remove \n
  vim.fn.setreg("+", taskName) -- Put string to + register (clipboard)

  Snacks.notify.info("Task name was copied to clipboard \"" .. taskName .. "\"")
end

return {
  copyTaskName = copyTaskName,
}
