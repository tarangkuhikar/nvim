return {
  'shumphrey/fugitive-gitlab.vim',
  config = function()
    vim.g.fugitive_gitlab_domains = { 'ssh://git.devstree.com', 'https://git.devstree.com' }
  end,
}
