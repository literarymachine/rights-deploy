#! /bin/sh
mkdir -p {{ deployment_home }}/.screen && chmod 700 {{ deployment_home }}/.screen
export SCREENDIR={{ deployment_home }}/.screen
cd {{ rights_app_dest }}/rights-app-dist

{% if proxy_host is defined and proxy_port is defined %}
export http_proxy=http://{{ proxy_host }}:{{ proxy_port }}
export https_proxy=http://{{ proxy_host }}:{{ proxy_port }}
screen -S rights-app -d -m bin/rights-app -Dhttp.port={{ rights_app_port }} -Dsource.site.git.branch={{ rights_site_build_branch }} -Dhttps.proxyHost={{ proxy_host }} -Dhttps.proxyPort={{ proxy_port }} -Dhttp.proxyHost={{ proxy_host }} -Dhttp.proxyPort={{ proxy_port }}
{% else %}
screen -S rights-app -d -m bin/rights-app -Dhttp.port={{ rights_app_port }} -Dsource.site.git.branch={{ rights_site_build_branch }}
{% endif %}
