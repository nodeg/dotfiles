return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status") -- to configure lazy pending updates count
    local colors = require("tokyonight.colors").setup({ transform = true })
    local config = require("tokyonight.config").options

    local tokyonight = {}

    tokyonight.normal = {
      a = { bg = colors.blue, fg = colors.black },
      b = { bg = colors.fg_gutter, fg = colors.blue },
      c = { bg = colors.bg_statusline, fg = colors.fg_sidebar },
    }
    
    tokyonight.insert = {
      a = { bg = colors.green, fg = colors.black },
      b = { bg = colors.fg_gutter, fg = colors.green },
    }
    
    tokyonight.command = {
      a = { bg = colors.yellow, fg = colors.black },
      b = { bg = colors.fg_gutter, fg = colors.yellow },
    }
    
    tokyonight.visual = {
      a = { bg = colors.magenta, fg = colors.black },
      b = { bg = colors.fg_gutter, fg = colors.magenta },
    }
    
    tokyonight.replace = {
      a = { bg = colors.red, fg = colors.black },
      b = { bg = colors.fg_gutter, fg = colors.red },
    }
    
    tokyonight.terminal = {
      a = {bg = colors.green1, fg = colors.black },
      b = {bg = colors.fg_gutter, fg=colors.green1 },
    }
    
    tokyonight.inactive = {
      a = { bg = colors.bg_statusline, fg = colors.blue },
      b = { bg = colors.bg_statusline, fg = colors.fg_gutter, gui = "bold" },
      c = { bg = colors.bg_statusline, fg = colors.fg_gutter },
    }

    -- configure lualine with modified theme
    lualine.setup({
      options = {
        theme = tokyonight,
      },
      sections = {
        lualine_a = { { "mode", icon = "" } },
        lualine_b = { { "branch", icon = "" } },
        lualine_c = {
            {
              "diagnostics",
              symbols = {
                  error = " ",
                  warn = " ",
                  info = " ",
                  hint = "󰝶 ",
              },
            },
            { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
            {
              "filename",
              symbols = { modified = "  ", readonly = "", unnamed = "" },
            },
            {
              function()
                return require("nvim-navic").get_location()
              end,
              cond = function()
                return package.loaded["nvim-navic"] and require("nvim-navic").is_available()
              end,
              color = { fg = colors.grey, bg = colors.none },
            },
        },
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#ff9e64" },
          },
          { "encoding" },
          { "fileformat" },
          { "filetype" },
        },
        lualine_y = {
          {
            "progress",
          },
          {
            "location",
            color = { fg = colors.cyan, bg = colors.none },
          },
        },
        lualine_z = {
          function()
            return "  " .. os.date("%X") .. ""
          end,
        },
      },
      extensions = { "fugitive", "lazy", "toggleterm", "mason", "neo-tree", "trouble" },
    })
  end,
}
