# CHANGELOG for tt-rss

## 0.1.0:

* Initial release of tt-rss

## 0.1.1:

* Added automated database and configuration setup

## 1.0.0:

* Don't setup the db schema if there is an existing database. Existing db tables
  are no longer dropped every time chef is run:
  https://github.com/mikelococo/tt-rss/commit/9e22ee028ee92f8acc22e43d9122e4280e94f464
* Add cron-job to do update feeds every 4 hours:
  https://github.com/mikelococo/tt-rss/commit/dff37ef6f8d31c79979b022e9062e375def60889
* Updated tt-rss tarball link to 1.13
* Support Ubuntu 14.04 and Apache 2.4
* Change server name attribute default from 'my-tinyrss.com' to 'localhost'
* Add server_aliases attribute to allow apache to respond to alternate names
* Change maintainer and migrate to new repo at https://github.com/mikelococo/tt-rss/
* Install but dont use php5-mcrypt for encrypting authenticated feed passwords
* Added `node['tt-rss']['log_destination']` attribute
* Added `node['tt-rss']['database']['host']` as foundation for future work
* When granting the tt-rss db user privilege, limit the grant to the tt-rss db.
* Fix bug where database is created twice

## 1.0.1

* Update changelog
