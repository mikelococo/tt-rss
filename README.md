Description
===========

Installs Tiny Tiny RSS and required apache2/php/mysql installation

Requirements
============
## Platforms

* Debian, Ubuntu

## Cookbooks

* apt
* apt
* apache2
* php >= 1.1.8
* mysql
* database

Attributes
==========

* `node['tt-rss']['database']['name']` - Name of the mysql database. Default is `tt-rss`
* `node['tt-rss']['database']['user']` - Name of the mysql user for the database. Default is `tt-rss`
* `node['tt-rss']['database']['password']` - Name of the password for the database user. Default is `tt-rss`
* `node['tt-rss']['download-url']` - Location of the Tiny Tiny RSS package. Default is [https://github.com/gothfox/Tiny-Tiny-RSS/archive/1.7.8.tar.gz](https://github.com/gothfox/Tiny-Tiny-RSS/archive/1.7.8.tar.gz)

* `node['tt-rss']['server_name']` - Name of the server, used in apache site configuration. Default `my-tinyrss.com`
* `node['tt-rss']['install_dir']` - Installation directory. Default `/opt/tt-rss`

Usage
=====

Run the default recipe and navigate to the web directory to finish the installation. (Default: `http://my-tinyrss.com`)