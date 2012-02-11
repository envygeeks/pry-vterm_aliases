require './lib/pry-vterm_aliases'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |spec|
  spec.name = "pry-vterm_aliases"
  spec.version = Pry::Plugins::VTerm.version
  spec.email = ["jordon@envygeeks.com"]
  spec.authors = ["Jordon Bedwell"]
  spec.add_dependency('pry', '~> 0.9.8')
  spec.description = "Preserve your VTerm aliases in Pry."
  spec.files = [
    "lib/pry",
    "readme.md",
    "license.txt",
    "lib/pry/aliases",
    "lib/pry/aliases/bash.rb",
    "lib/pry-vterm_aliases.rb",
    "rakefile.rb",
    "gemfile.rb"
  ]
  spec.homepage = 'https://github.com/envygeeks/pry-vterm_aliases'
  spec.licenses = ["MIT"]
  spec.require_paths = ["lib"]
  spec.summary = "Preserve your VTerm aliases in Pry."
end
