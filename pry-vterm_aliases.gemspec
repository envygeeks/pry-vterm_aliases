require './lib/pry-vterm_aliases'
Gem::Specification.new do |spec|
  spec.license = 'MIT'
  spec.name = 'pry-bash_aliases'
  spec.version = Pry::Plugins::VTerm.version
  spec.require_paths = ['lib']
  spec.files = Dir.glob('lib/**/*')
  spec.authors = ['Jordon Bedwell']
  spec.email = ['jordon@envygeeks.com']
  spec.add_dependency('pry')
  spec.homepage = 'https://github.com/envygeeks/pry-bash_aliases'
  spec.summary = 'Preserve your VTerm aliases in Pry.'
  spec.description = 'Preserve your VTerm aliases in Pry.'
  spec.files+= %w(readme.md license.txt rakefile.rb gemfile.rb)
end