require File.expand_path("../lib/pry-vterm_aliases/version", __FILE__)

Gem::Specification.new do |s|
  s.version = Pry::VTermAliases::VERSION
  s.email = ["envygeeks@gmail.com"]
  s.authors = ["Jordon Bedwell"]
  s.name = "pry-vterm_aliases"
  s.licenses = ["MIT"]
  s.add_dependency("pry")
  s.require_paths = ["lib"]
<<<<<<< HEAD
  s.add_development_dependency("rspec", "~> 2.13")
=======
  s.add_dependency("pry", "~> 0.9.12")
  s.add_development_dependency("rspec", "~> 2.12.0")
>>>>>>> d92e9d3d22456e4a7a7d6dd59a61e123a1939eda
  s.summary = "Enable your Bash and ZSH alises in Pry."
  s.description = "Enable your Bash and ZSH alises in Pry shell."
  s.homepage = "http://envygeeks.com/projects/pry-vterm_aliases/"
  s.files = ["Readme.md", "Rakefile", "MIT-License", "Gemfile"] + Dir["lib/**/*"]
end
