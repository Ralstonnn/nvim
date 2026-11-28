vim.filetype.add({
  pattern = {
    ['compose.*%.ya?ml'] = 'yaml.docker-compose',
    ['docker%-compose%.ya?ml'] = 'yaml.docker-compose',
    ['docker%-compose%..*%.ya?ml'] = 'yaml.docker-compose',
    ['Dockerfile%.%w+'] = 'dockerfile',
    ['.*%.pcss'] = 'css',
  }
})
