vim.filetype.add({
  pattern = {
    ['compose.*%.ya?ml'] = 'yaml.docker-compose',
    ['Dockerfile%.%w+'] = 'dockerfile',
  }
})
