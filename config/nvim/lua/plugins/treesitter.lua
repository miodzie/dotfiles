require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    -- PHP docblocks are whack, meh
    -- additional_vim_regex_highlighting = true
  },
  incremental_selection = {
    enable = true 
  },
  indent = {
    enable = true
  }
}
