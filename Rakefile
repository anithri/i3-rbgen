require "bundler/gem_tasks"
require "rspec/core/rake_task"
require 'rake/version_task'
RSpec::Core::RakeTask.new(:spec)

task :default => :spec

Rake::VersionTask.new do |task|
  task.with_git_tag = true
end

