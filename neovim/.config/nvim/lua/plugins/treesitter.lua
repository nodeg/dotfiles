return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = 'main',
    lazy = false,
    build = ":TSUpdate",
    opts = {
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
      },
  },
}
