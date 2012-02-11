require './lib/pry-vterm_aliases'
require 'rubygems/package_task'
require 'rake/testtask'
task :default => [:test]

Rake::TestTask.new { |test| test.verbose, test.pattern = true, 'tests/**/*.rb' }
Gem::PackageTask.new(eval(IO.read('pry-vterm_aliases.gemspec'))) { |pkg| pkg.need_tar, pkg.need_zip = true }