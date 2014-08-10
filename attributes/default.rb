#
# Cookbook Name:: tt-rss
# Recipe:: default
#
#
default['tt-rss']['database']['user']     = 'tt-rss'
default['tt-rss']['database']['password'] = 'tt-rss'
default['tt-rss']['database']['name']     = 'tt-rss'

default['tt-rss']['download-url'] = 'https://github.com/gothfox/Tiny-Tiny-RSS/archive/1.10.tar.gz'

default['tt-rss']['server_name'] = 'my-tinyrss.com'
default['tt-rss']['url']         = 'http://my-tinyrss.com'
default['tt-rss']['install_dir'] = '/opt/tt-rss'

# sql for in-app (view with Preferences -> system,
# syslog to log to the system logs,
# empty string for php logging (which is usually to error.log)
default['tt-rss']['log_destination'] = 'sql'

default['tt-rss']['update_feeds']['cron'] = true
default['tt-rss']['update_feeds']['cron_expression'] = '17 */4 * * *'
