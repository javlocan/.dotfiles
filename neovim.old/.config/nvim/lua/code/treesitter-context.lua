
return {
  { 'nvim-treesitter/nvim-treesitter-context',
    dependencies = {'nvim-treesitter/nvim-treesitter'},
  opts = {
  line_numbers = true,
  mode = 'cursor',
  trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
    },
}}
