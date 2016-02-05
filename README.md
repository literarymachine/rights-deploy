# Ansible playbooks for rightsstatements.org deployment

## rights-app
rights-app is retrieved as binary from GitHub releases, defaulting to latest.

## rights-site
rights-site is hosted as an [organizational site on GitHub pages](https://help.github.com/articles/user-organization-and-project-pages/#user--organization-pages).

## rights-proxy
rights-proxy is configured using Apache as a [reverse proxy](http://httpd.apache.org/docs/2.2/mod/mod_proxy.html#forwardreverse). `/vocab`, `/data` and `/page` go to the rights-app, any other paths go to rights-site.
