return {
  'ahmedkhalf/project.nvim',
  event = 'LazyFile',
  dependencies = { 'nvim-telescope/telescope.nvim' },
  config = function(_, opts)
    require('project_nvim').setup(opts)
    require('telescope').load_extension 'projects'
  end,
}
