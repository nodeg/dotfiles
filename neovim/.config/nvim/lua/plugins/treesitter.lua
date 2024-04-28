return {
  {
    "nvim-treesitter/nvim-treesitter",
    config = function() 
      -- import nvim-treesitter plugin
      local treesitter = require("nvim-treesitter.configs")

      -- configure treesitter
      treesitter.setup({ -- enable syntax highlighting
        highlight = {
          enable = true,
        },
        -- enable indentation
        indent = {
          enable = true
        },
        -- ensure these language parsers are installed
        ensure_installed = {
          "bash",
          "c",
          "css",
          "dockerfile",
          "fish",
          "gitignore",
          "go",
          "groovy",
          "html",
          "json",
          "java",
          "javascript",
          "lua",
          "markdown",
          "markdown_inline",
          "python",
          "query",
          "regex",
          "ruby",
          "terraform",
          "vim",
          "vimdoc",
          "yaml",
        },
      })
    end,
  },
}
