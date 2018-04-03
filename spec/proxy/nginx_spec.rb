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
