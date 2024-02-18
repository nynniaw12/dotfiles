local noice = require("noice")

require('lualine').setup {
  options = {
    icons_enabled = true,
    component_separators = '|',
    section_separators = '',
  },
  sections = {
    lualine_x = {
      {
        noice.api.statusline.mode.get,
        cond = noice.api.statusline.mode.has,
        color = { fg = "#ff9e64" },
      }
    },
    lualine_a = {
      {
        'buffers',
      }
    }
  }
}

