require File.expand_path("../lib/pry-vterm_aliases/version", __FILE__)

Gem::Specification.new do |s|
  s.version = Pry::VTermAliases::VERSION
  s.email = ["envygeeks@gmail.com"]
  s.authors = ["Jordon Bedwell"]
  s.name = "pry-vterm_aliases"
  s.licenses = ["MIT"]
  s.add_dependency("pry")
  s.require_paths = ["lib"]
  s.add_development_dependency("rspec")
  s.summary = "Enable your Bash and ZSH alises in Pry."
  s.description = "Enable your Bash and ZSH alises in Pry."
  s.homepage = "http://envygeeks.com/projects/pry-vterm_aliases/"
  s.files = ["Readme.md", "Rakefile", "License", "Gemfile"] + Dir["lib/**/*"]
end
