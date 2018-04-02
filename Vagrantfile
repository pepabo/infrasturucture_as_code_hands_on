# -*- mode: ruby -*-

Vagrant.require_version '>= 1.9.0'
plugins = [
  {
    plugin: 'vagrant-properties',
    version: '~> 0.9'
  },
  {
    plugin: 'vagrant-itamae',
    version: '~> 0.2'
  },
]

# 必須プラグインのチェック
plugins.each do |p|
  unless Vagrant.has_plugin?(p[:plugin], p[:version])
    action = Vagrant.has_plugin?(p[:plugin]) ? 'update' : 'install'
    Dir.chdir(Dir.home) { system "vagrant plugin #{action} #{p[:plugin]}" }
  end
end

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"

  config.properties.to_hash.each do |(name, p)|
    config.vm.define name do |c|
      c.vm.network :private_network, ip: p.mng_ip if p.respond_to?(:mng_ip)
      c.vm.hostname = p.hostname
      # itamaeでプロビジョン可能にする
      c.vm.provision :itamae do |itamae|
        itamae.sudo = true
        itamae.shell = '/bin/bash'
        itamae.recipes = ['./bootstrap.rb']
        itamae.yaml= "./nodes/#{p.role}.yaml"
      end
    end
  end
end
