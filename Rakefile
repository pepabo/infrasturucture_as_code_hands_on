require 'rake'
require 'yaml'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'
RuboCop::RakeTask.new

task spec: 'spec:all'
task default: :spec

namespace :spec do
  def properties
    YAML.load_file('vagrant_properties.yml')
  end

  targets = []
  properties.each do |host, _|
    targets << host
  end

  task all: targets
  task default: :all

  targets.each do |target|
    desc "Run serverspec tests to #{target}"
    RSpec::Core::RakeTask.new(target.to_sym) do |t|
      ENV['TARGET_HOST'] = target
      t.pattern = "spec/#{target.gsub(/-.+/, '')}/*_spec.rb"
    end
  end
end
