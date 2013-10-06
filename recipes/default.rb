#
# Cookbook Name:: tt-rss
# Recipe:: default
#
#

# update apt
include_recipe "apt"

# install apache2
include_recipe "apache2"

# install php
include_recipe "php"
include_recipe "apache2::mod_php5"

package "php-apc"
package "php5-mysql"
package "php5-curl"
package "php5-mcrypt"

# install mysql
include_recipe "mysql::client"
include_recipe "mysql::server"

# create database
include_recipe "database"
gem_package "mysql"

database_name      = node['tt-rss']['database']['name']
database_user      = node['tt-rss']['database']['user']
database_passsword = node['tt-rss']['database']['password']

mysql_database database_name do
  connection ({:host => "localhost", :username => 'root', :password => node['mysql']['server_root_password']})
  action :create
end

mysql_database database_name do
  connection ({:host => "localhost", :username => 'root', :password => node['mysql']['server_root_password']})
  action :create
end

mysql_database_user database_user do
  connection ({:host => "localhost", :username => 'root', :password => node['mysql']['server_root_password']})
  password database_passsword
  database_name node['tt-rss']['database']['name']
  host 'localhost'
  action [:create, :grant]
end

install_dir = node['tt-rss']['install_dir']

directory install_dir do
  owner node['apache']['user']
  group node['apache']['group']
  mode 0755
  action :create
end

# download tt-rss
remote_file "#{install_dir}/tt-rss.tar.gz" do
  source node['tt-rss']['download-url']
  mode 00644
end

# unpack tt-rss
execute "unpack" do
  command "tar -zxf #{install_dir}/tt-rss.tar.gz --strip=1"
  cwd install_dir
end

execute "set permissions" do
  command "chown -R #{node['apache']['user']}.#{node['apache']['group']} *"
  cwd install_dir
end

# setup config file
template "config.php" do
  variables(
      :db_user => database_user,
      :db_name => database_name,
      :db_password => database_passsword,
      :url => node['tt-rss']['url']
  )

  owner node['apache']['user']
  group node['apache']['group']
  mode 0600

  path "#{install_dir}/config.php"

  action :create
end

# setup database scheme
mysql_database database_name do
  connection ({:host => "localhost", :username => 'root', :password => node['mysql']['server_root_password']})
  sql { ::File.open("#{install_dir}/schema/ttrss_schema_mysql.sql").read }
  action :query
end
