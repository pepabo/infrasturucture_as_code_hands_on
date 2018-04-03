require 'spec_helper'
%w(
  apache2
  php7.0
  libapache2-mod-php7.0
).each do |n|
  describe package(n) do
    it { should be_installed }
  end
end

describe service('apache2') do
  it { should be_enabled }
  it { should be_running }
end

describe port(80) do
  it { should be_listening }
end

describe command('curl http://127.0.0.1/ -o /dev/null -w "%{http_code}\n" -s') do
  its(:stdout) { should match /^200$/ }
end
