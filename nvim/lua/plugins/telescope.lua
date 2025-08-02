return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      file_ignore_patterns = {
        "node_modules/",
        "%.git/",
        "dist/",
        "build/",
        "%.cache/",
        "%.lock$",
        "%.log$",
        "%.sqlite3$",
        "__pycache__/",
        "%.DS_Store",
        ".vscode/",
        ".idea/",
        "tmp/",
        "temp/",
        "coverage/",
        "%.class$",
        "%._.*",
      },
    },
  },
}
