# encoding: UTF-8
require 'serverspec'
include SpecInfra::Helper::Exec
include SpecInfra::Helper::DetectOS
require 'net/http'

describe package('php-apc') do
  it { is_expected.to be_installed }
end
describe package('php5-mysql') do
  it { is_expected.to be_installed }
end
describe package('php5-curl') do
  it { is_expected.to be_installed }
end
describe package('php5-mcrypt') do
  it { is_expected.to be_installed }
end

describe file('/opt/tt-rss') do
  it { is_expected.to be_directory }
end

describe file('/opt/tt-rss/config.php') do
  it { is_expected.to be_file }
end

describe file('/etc/cron.d/ttrss-update') do
  it { is_expected.to be_file }
  its(:content) { is_expected.to include '/usr/bin/php' }
end

describe service('apache2') do
  it { is_expected.to be_enabled }
  it { is_expected.to be_running }
end

describe port(80) do
  it { is_expected.to be_listening }
end

describe 'tt-rss homepage' do
  let(:response) do
    req = Net::HTTP::Get.new('http://localhost/')
    # req.add_field('Host', 'my-tinyrss.com')
    connection = Net::HTTP.new('localhost', 80).start
    connection.request(req)
  end
  it { expect(response.code).to eq('200') }
  it { expect(response.body).to include '<title>Tiny Tiny RSS : Login</title>' }
end
