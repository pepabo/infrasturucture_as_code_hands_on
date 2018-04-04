require 'spec_helper'
%w(
  nginx
).each do |n|
  describe package(n) do
    it { should be_installed }
  end
end

describe service('nginx') do
  it { should be_enabled }
  it { should be_running }
end

describe port(80) do
  it { should be_listening }
end

describe file('/etc/nginx/conf.d/www.conf') do
  its(:content) { should match /server 172.18.1.31/ }
  its(:content) { should match /server 172.18.1.32/ }
end

describe file('/etc/nginx/sites-enabled') do
  it { should_not exist }
end

describe file('/etc/nginx/sites-available') do
  it { should_not exist }
end
