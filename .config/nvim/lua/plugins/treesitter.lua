require'nvim-treesitter.configs'.setup {
  ensure_installed = { "lua", "vim", "vimdoc", "query" },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  -- List of parsers to ignore installing (or "all")
  ignore_install = { "javascript" }
}
