Description
===========

This cookbook installs [Tiny Tiny RSS](http://tt-rss.org/) (aka tt-rss), an open-source web-based reader for RSS and Atom feeds. This cookbook configures tt-rss to run on Apache, PHP, and MySQL.

Usage
=====

With An Existing Site
---------------------

If you have an existing apache site:

1. Include only the `default` recipe in your chef run-list.
2. Set `node['tt-rss']['install_dir']` to a location inside your web-root (for
   example `/var/www/tt-rss/`).
3. Set `node['tt-rss']['url']` to match (for example
   `http://my-site.com/tt-rss/`)

* Navigate to url set in `node['tt-rss']['url']` and log in with `admin/password`

Create A New Site
-----------------

If you want this cookbook to create a new apache site config and enable it:

1. Include to both the `default` and `apache-site` recipes in your chef run-list.
2. Set `node['tt-rss']['server_name']` to the DNS name of your web-server.

First-Time Login
----------------

1. Navigate to url set in `node['tt-rss']['url']` and log in with
   `admin/password`.
2. Go to preferences and change your password immediately.

Attributes
==========

* `node['tt-rss']['database']['name']` - Name of the mysql database. Default is `tt-rss`
* `node['tt-rss']['database']['user']` - Name of the mysql user for the database. Default is `tt-rss`
* `node['tt-rss']['database']['password']` - Password for the database user. Default is `tt-rss`
* `node['tt-rss']['download-url']` - Location of the Tiny Tiny RSS package. Default is [https://github.com/gothfox/Tiny-Tiny-RSS/archive/1.10.tar.gz](https://github.com/gothfox/Tiny-Tiny-RSS/archive/1.10.tar.gz)
* `node['tt-rss']['url']` - URL of the web site. Default `http://localhost`
* `node['tt-rss']['server_name']` - Name of the server, used in apache site configuration. Default `localhost`
* `node['tt-rss']['server_aliases']` - Array of additional names to which the server responds, if your server only responds to a single name, this should have one entry which is the same as server_name. Used in apache site configuration. Default `localhost`
* `node['tt-rss']['install_dir']` - Installation directory. Default `/opt/tt-rss`
* `node['tt-rss']['log_destination']` - Tiny Tiny RSS log destination configuration. Valid values are `sql` to log in the database (can be read using Preferences -> System), `syslog` to log to the system log, or blank string which uses PHP logging. Default `sql`
* `node['tt-rss']['update_feeds']['cron']` - If true, the cookbook installs a cron job to update feeds in /etc/cron.d/ttrss-update. Default `true`
* `node['tt-rss']['install_dir']['cron_expression']` - The cron expression that determines how frequently to update feeds.  Default `17 */4 * * * (every 4 hours at 17min after the hour)`

Requirements
============

Platforms
---------

This cookbook is likely to run on any relatively recent debian-like, but it's tested on the following platforms:

* Ubuntu 12.04 Precise Precise Pangolin
* Ubuntu 14.04 Trusty Tahr (Apache 2.4 requires apache2 cookbook >= 2.0.0)
* Debian 7 Wheezy

Cookbooks
---------

* apt
* apache2 (>= 2.0.0 for Apache 2.4 support)
* php >= 1.1.8
* mysql
* database

Versioning
==========

This cookbook uses semantic versioning as defined at http://chef-community.github.io/cvp/

Contributing
============

Feedback, documentation improvements, bug reports, and code contributions are
welcome. To hack on the cookbook:

1. Install the gems needed for development and testing: `bundle install`
2. Manually run ruby syntax checks: `bundle exec rubocop`
3. Manually run foodcritic lint checks: `bundle exec foodcritic .`
4. Manually run chefspec unit tests: `bundle exec rspec` (there are many
   expected resource-clone warnings)
5. Manually run test-kitchen integration tests for your desired platform:
   - List test-kitchen platforms: `bundle exec kitchen list`
   - Create, converge, and verify your chose platform: `bundle exec kitchen verify default-ubuntu-1204`
6. Use guard to automatically run all tests whenever you save a file: `bundle exec guard`

Maintainer Change
-----------------

This cookbook was originally written by @wtreur and maintainership was transferred to @mikelococo in January of 2014.

- The updated github page is https://github.com/mikelococo/tt-rss
- The updated clone url is https://github.com/mikelococo/tt-rss.git
