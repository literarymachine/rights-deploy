# Ansible playbooks for rightsstatements.org deployment

Please refer to the inventory files to see default variable settings.

## rights-app
rights-app is retrieved as a binary from the GitHub releases at `rights_app_repo_url`. It can be deployed by running

    $ ansible-playbook -i staging app.yml

This will download and unzip `rights_app_release` to `rights_app_dest` and run it on `rights_app_port`.

## rights-site
rights-site is retrieved as static html from `rights_site_build_branch` of `rights_site_repo_url`. It can be deployed by running

    $ ansible-playbook -i staging site.yml

This will clone the repository to `rights_site_dest` and check out the selected build branch. Apache will be configured to listen on `rights_site_port` and a virtual host will be set up to serve the content.

## rights-proxy
rights-proxy is configured using Apache as a [reverse proxy](http://httpd.apache.org/docs/2.2/mod/mod_proxy.html#forwardreverse). `/vocab`, `/data` and `/page` go to the `rights-app`, any other paths go to `rights-site`. It can be deployed by running

    $ ansible-playbook -i staging proxy.yml

This will create an Apache virtual host that listens on port 80 and proxies as described above.
