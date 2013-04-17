#
# Cookbook Name:: tt-rss
# Recipe:: apache-site
#
#

install_dir = node['tt-rss']['install_dir']

# install web app in apache
web_app "tt-rss" do
  server_name node['tt-rss']['server_name']
  server_aliases []
  docroot install_dir
end

