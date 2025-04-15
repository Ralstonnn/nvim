-- Plugin to make pretty screenshots
return {
  "mistricky/codesnap.nvim",
  build = "make",
  opts = {
    bg_padding = 0,
    watermark = "",
    mac_window_bar = false,
    has_breadcrumbs = true,
    has_line_number = true,
  },
}
