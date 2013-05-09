require File.expand_path("../lib/pry-vterm_aliases/version", __FILE__)

Gem::Specification.new do |spec|
  spec.add_development_dependency("luna-rspec-formatters")
  spec.add_development_dependency("coveralls")
  spec.version = Pry::VTermAliases::VERSION
  spec.add_development_dependency("rake")
  spec.email = ["envygeeks@gmail.com"]
  spec.authors = ["Jordon Bedwell"]
  spec.name = "pry-vterm_aliases"
  spec.licenses = ["MIT"]
  spec.add_dependency("pry")
  spec.require_paths = ["lib"]
  spec.add_development_dependency("rspec")
  spec.add_development_dependency("simplecov")
  spec.add_development_dependency("guard-rspec")
  spec.summary = "Enable your Bash and ZSH alises in Pry."
  spec.description = "Enable your Bash and ZSH alises in Pry shell."
  spec.homepage = "http://envygeeks.com/projects/pry-vterm_aliases/"
  spec.files = ["Readme.md", "Rakefile", "License", "Gemfile"] + Dir["lib/**/*"]
end
