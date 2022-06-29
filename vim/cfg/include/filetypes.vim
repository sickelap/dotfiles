au BufRead,BufNewFile *.yaml.j2,*.yml.j2 setlocal filetype=yaml.jinja2

au BufRead,BufNewFile
      \ *roles/*.yml,*roles/*.yaml,*playbooks/*.yml,*playbooks/*.yaml
      \ setlocal filetype=yaml.ansible
