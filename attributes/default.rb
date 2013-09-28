#
# Cookbook Name:: tt-rss
# Recipe:: default
#
#
default['tt-rss']['database']['user']     = 'tt-rss'
default['tt-rss']['database']['password'] = 'tt-rss'
default['tt-rss']['database']['name']     = 'tt-rss'
default['tt-rss']['database']['host']     = 'localhost'

default['tt-rss']['download-url'] = 'https://github.com/gothfox/Tiny-Tiny-RSS/archive/1.10.tar.gz'

default['tt-rss']['server_name'] = "my-tinyrss.com"
default['tt-rss']['url']         = "http://my-tinyrss.com"
default['tt-rss']['install_dir'] = "/opt/tt-rss"

default['tt-rss']['log_destination'] = 'sql'
