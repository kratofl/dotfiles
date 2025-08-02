return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = function()
      return {
        {
          "<leader>fe",
          function()
            require("neo-tree.command").execute({ toggle = true, position = "float", dir = LazyVim.root() })
          end,
          desc = "Explorer NeoTree (Root Dir)",
        },
        {
          "<leader>fE",
          function()
            require("neo-tree.command").execute({ toggle = true, position = "float", dir = vim.uv.cwd() })
          end,
          desc = "Explorer NeoTree (cwd)",
        },
        { "<leader>e", "<leader>fe", desc = "Explorer NeoTree (Root Dir)", remap = true },
        { "<leader>E", "<leader>fE", desc = "Explorer NeoTree (cwd)", remap = true },
        {
          "<leader>ge",
          function()
            require("neo-tree.command").execute({ source = "git_status", toggle = true })
          end,
          desc = "Git Explorer",
        },
        {
          "<leader>bE",
          function()
            require("neo-tree.command").execute({ source = "buffers", position = "left", toggle = true })
          end,
          desc = "Buffer Explorer",
        },
        {
          "<leader>be",
          function()
            require("neo-tree.command").execute({ source = "buffers", position = "float", toggle = true })
          end,
          desc = "Buffer Explorer (float)",
        },
      }
    end,
    opts = {
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          always_show_by_pattern = {
            ".env.*",
          },
          never_show = {
            ".DS_Store",
            "thumbs.db",
            ".git",
          },
          never_show_by_pattern = {
            "._*",
          },
        },
      },
      git_status = {
        window = {
          position = "float",
          mappings = {
            ["A"] = "git_add_all",
            ["gu"] = "git_unstage_file",
            ["ga"] = "git_add_file",
            ["gr"] = "git_revert_file",
            ["gc"] = "git_commit",
            ["gp"] = "git_push",
            ["gg"] = "git_commit_and_push",
            ["o"] = { "show_help", nowait = false, config = { title = "Order by", prefix_key = "o" } },
            ["oc"] = { "order_by_created", nowait = false },
            ["od"] = { "order_by_diagnostics", nowait = false },
            ["om"] = { "order_by_modified", nowait = false },
            ["on"] = { "order_by_name", nowait = false },
            ["os"] = { "order_by_size", nowait = false },
            ["ot"] = { "order_by_type", nowait = false },
          },
        },
      },
    },
  },
}
