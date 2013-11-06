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
* `node['tt-rss']['url']` - URL of the web site. Default `http://my-tinyrss.com/`
* `node['tt-rss']['server_name']` - Name of the server, used in apache site configuration. Default `my-tinyrss.com`
* `node['tt-rss']['install_dir']` - Installation directory. Default `/opt/tt-rss`
* `node['tt-rss']['log_destination']` - Tiny Tiny RSS log destination configuration. Valid values are `sql` to log in the database (can be read using Preferences -> System), `syslog` to log to the system log, or blank string which uses PHP logging. Default `sql`
* `node['tt-rss']['install_dir']` - Installation directory. Default `/opt/tt-rss`
* `node['tt-rss']['update_feeds']['cron']` - If true, the cookbook installs a cron job to update feeds in /etc/cron.d/ttrss-update. Default `true`
* `node['tt-rss']['install_dir']['cron_expression']` - The cron expression that determines how frequently to update feeds.  Default `17 */4 * * * (every 4 hours at 17min after the hour)`

Usage
=====

## Inside an existing website
* Just run the `default` recipe. Make sure `node['tt-rss']['install_dir']` is located inside your web-root. (E.G. `/var/www/tt-rss/`) and make
sure `node['tt-rss']['url']` is set accordingly (E.G. `http://my-site.com/tt-rss/`)
* Navigate to url set in `node['tt-rss']['url']` and log in with `admin/password`

## With dedicated apache site configuration
* Run the `default` recipe and the `apache-site` recipe. Make sure `node['tt-rss']['server_name']` is set.
* Navigate to url set in `node['tt-rss']['url']` and log in with `admin/password`