require "rubygems/package_task"
require "rake/testtask"

task :default => [:test]
task :spec => :test

Rake::TestTask.new { |t| t.verbose, t.pattern = true, "test/**/*_test.rb" }
Gem::PackageTask.new(eval(IO.read("pry-vterm_aliases.gemspec"))) { |p|
  p.need_tar, p.need_zip = true
}
