# encoding: utf-8
source 'https://rubygems.org'

# Chef Baseline
gem 'rake'
gem 'chef'
gem 'knife-solo'
# Without a version specification, bundler defaults to an old 2.x version of berkshelf.
# Bundler... you had one job: https://github.com/bundler/bundler/issues/3089
gem 'berkshelf', '>= 3.1.5'

# Linting and style tests
gem 'rubocop'
gem 'foodcritic'
gem 'thor-foodcritic'

# Unit tests with chefspec
gem 'chefspec'
gem 'mysql' # Needed for chefspec to parse the tt-rss cookbook

# Integration tests with test-kitchen
# Until https://github.com/test-kitchen/test-kitchen/issues/485 is resolved
# use my fork which is compatible with
# https://github.com/fgrehm/vagrant-lxc-base-boxes
gem 'test-kitchen',
  github: 'mikelococo/test-kitchen-utf8-drivers',
  branch: 'utf8-drivers'
gem 'kitchen-vagrant'

# Test automation with guard
gem 'guard',
  github: 'mikelococo/guard-libnotify-on-failure',
  branch: 'libnotify-on-failure'
gem 'guard-rubocop'
gem 'guard-foodcritic'
gem 'guard-rspec'
gem 'guard-kitchen'
gem 'libnotify' # Guard uses libnotify for gui notifications on Ubuntu
# Guard has the same UTF8/US-ASCII problem that test-kitchen does, but the
# issue is in mixlib-shellout. I didn't bother to file a bug because they
# alrady have an (out of date) utf-8 branch, so much be aware of the issue.
# similar deal to:
# https://github.com/test-kitchen/test-kitchen/issues/485
gem 'mixlib-shellout',
  github: 'mikelococo/mixlib-shellout-utf8',
  branch: 'utf8'
