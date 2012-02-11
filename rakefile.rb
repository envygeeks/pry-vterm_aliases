require './lib/pry-vterm_aliases'
require 'rubygems/package_task'
require 'rake/testtask'
task :default => [:test]

Rake::TestTask.new { |test| test.verbose, test.pattern = true, 'tests/**/*.rb' }

namespace :build do
  ['universal-darwin', 'universal-linux'].each do |platform|
    spec = Gem::Specification.new do |spec|
      spec.license = 'MIT'
      spec.name = 'pry-vterm_aliases'
      spec.version = Pry::Plugins::VTerm.version
      spec.require_paths = ['lib']
      spec.files = Dir.glob('lib/**/*')
      spec.authors = ['Jordon Bedwell']
      spec.email = ['jordon@envygeeks.com']
      spec.platform = platform.to_s
      spec.add_dependency('pry', '~> 0.9.8')
      spec.homepage = 'https://github.com/envygeeks/pry-vterm_aliases'
      spec.summary = 'Preserve your VTerm aliases in Pry.'
      spec.description = 'Preserve your VTerm aliases in Pry.'
      spec.files+= %w(readme.md license.txt rakefile.rb gemfile.rb)
    end

    task :gemspec do
      File.open("#{spec.name}.gemspec", "w") do |file|
        file << spec.to_ruby
      end
    end

    Gem::PackageTask.new(spec) do |pkg|
      pkg.need_tar, pkg.need_zip = true
    end
  end
end