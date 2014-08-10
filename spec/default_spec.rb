require 'chefspec'

describe 'tt-rss' do
  let(:chef_run) do
    runner = ChefSpec::Runner.new(platform: 'ubuntu', version: '12.04')
    # When running under chef-solo (or chefspec), the mysql cookbook checks
    # for these attributes and raising a Chef::Application.fatal if they're
    # missing.
    runner.node.set['mysql']['server_root_password']   = 'test_pw'
    runner.node.set['mysql']['server_repl_password']   = 'test_pw'
    runner.node.set['mysql']['server_debian_password'] = 'test_pw'
    runner.converge 'tt-rss::default'
    runner
  end
  it 'installs php-apc' do
    expect(chef_run).to install_package 'php-apc'
  end
  it 'installs php5-mysql' do
    expect(chef_run).to install_package 'php5-mysql'
  end
  it 'installs php5-curl' do
    expect(chef_run).to install_package 'php5-curl'
  end
  it 'installs php5-mcrypt' do
    expect(chef_run).to install_package 'php5-mcrypt'
  end
  it 'creates the tt-rss install dir' do
    expect(chef_run)
      .to create_directory "#{chef_run.node['tt-rss']['install_dir']}"
  end
  it 'downloads tt-rss' do
    let(:filename) { "#{chef_run.node['tt-rss']['install_dir']}/tt-rss.tar.gz" }
    expect(chef_run).to create_remote_file :filename
  end
  it 'creates the tt-rss config.php' do
    let(:config_file) { "#{chef_run.node['tt-rss']['install_dir']}/config.php" }
    expect(chef_run).to create_file :config_file
    # rubocop:disable Style/LineLength
    # expect(chef_run).to create_file_with_content "#{chef_run.node['tt-rss']['install_dir']}/config.php", 'define'
    # rubocop:enable Style/LineLength
  end
  it 'creates the update_feeds cronjob' do
    expect(chef_run)
      .to create_file_with_content '/etc/cron.d/ttrss-update', '/usr/bin/php'
  end
end
