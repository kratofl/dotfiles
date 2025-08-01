return {
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    flavour = "mocha",
    opts = {
      color_overrides = {
        mocha = {
          base = "#140a00",
        },
      },
      highlight_overrides = {
        mocha = function(mocha)
          return {
            LineNrAbove = { fg = mocha.overlay1 },
            LineNrBelow = { fg = mocha.overlay1 },
            CursorLine = { bg = "#140a00" },
          }
        end,
      },
    },
    specs = {
      {
        "akinsho/bufferline.nvim",
        optional = true,
        opts = function(_, opts)
          if (vim.g.colors_name or ""):find("catppuccin") then
            local mocha = require("catppuccin.palettes").get_palette("mocha")
            opts.highlights = require("catppuccin.groups.integrations.bufferline").get({
              custom = {
                mocha = {
                  buffer_visible = {
                    fg = mocha.overlay2,
                  },
                },
              },
            })
          end
        end,
      },
    },
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    opts = {
      styles = {
        transparency = false,
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
      --colorscheme = "rose-pine",
    },
  },
}
