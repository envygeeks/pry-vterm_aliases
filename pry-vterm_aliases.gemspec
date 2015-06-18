require File.expand_path("../lib/pry-vterm_aliases/version", __FILE__)

Gem::Specification.new do |spec|
  spec.description = "Enable your Bash and ZSH alises in Pry shell."
  spec.summary = "Enable your Bash and ZSH alises in Pry."
  spec.version = Pry::VTermAliases::VERSION
  spec.email = ["jordon@envygeeks.io"]
  spec.authors = ["Jordon Bedwell"]
  spec.name = "pry-vterm_aliases"
  spec.licenses = ["MIT"]
  spec.require_paths = ["lib"]
  spec.homepage = "https://github.com/envygeeks/pry-vterm_aliases"
  spec.files = ["README.md", "Rakefile", "LICENSE", "Gemfile"] + Dir["lib/**/*"]

  spec.add_dependency("pry", "~> 0.10")
  spec.add_development_dependency("rspec", "~> 3.3")
  spec.add_development_dependency("envygeeks-coveralls", "~> 1.0")
  spec.add_development_dependency("luna-rspec-formatters", "~> 3.3")
end
