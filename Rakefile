require 'rake'
require 'rubygems'
gem 'rspec'
require 'spec/rake/spectask'
 
desc 'Default: run unit tests.'
task :default => :spec
 
desc 'Test the  plugin.'
Spec::Rake::SpecTask.new(:spec) do |t|
  t.libs << 'lib'
  t.verbose = true
end

# require 'rake/testtask'
# require 'rake/rdoctask'
# 
# desc 'Default: run unit tests.'
# task :default => :test
# 
# desc 'Test the emailthing_collector plugin.'
# Rake::TestTask.new(:test) do |t|
#   t.libs << 'lib'
#   t.libs << 'test'
#   t.pattern = 'test/**/*_test.rb'
#   t.verbose = true
# end
# 
# desc 'Generate documentation for the emailthing_collector plugin.'
# Rake::RDocTask.new(:rdoc) do |rdoc|
#   rdoc.rdoc_dir = 'rdoc'
#   rdoc.title    = 'EmailthingCollector'
#   rdoc.options << '--line-numbers' << '--inline-source'
#   rdoc.rdoc_files.include('README')
#   rdoc.rdoc_files.include('lib/**/*.rb')
# end
