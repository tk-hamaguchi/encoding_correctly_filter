begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

require 'rdoc/task'

RDoc::Task.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'EncodingCorrectlyFilter'
  rdoc.options << '--line-numbers'
  rdoc.rdoc_files.include('README.rdoc')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

begin
  require 'rubocop/rake_task'
  RuboCop::RakeTask.new
rescue LoadError
  puts 'Cannot require "rubocop/rake_task".'
end

begin
  require 'cucumber'
  require 'cucumber/rake/task'

  Cucumber::Rake::Task.new(:features) do |t|
    t.cucumber_opts = 'features --format pretty'
  end
rescue LoadError
  puts 'Cannot require "cucumber/rake/task".'
end

begin
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new('spec')
rescue LoadError
  puts 'Cannot require "rspec/core/rake_task".'
end

Bundler::GemHelper.install_tasks

task default: %i(spec features rubocop)
