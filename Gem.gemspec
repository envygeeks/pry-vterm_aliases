require File.expand_path("../lib/pry-vterm_aliases/version", __FILE__)

Gem::Specification.new do |spec|
  spec.description = "Enable your Bash and ZSH alises in Pry shell."
  spec.summary = "Enable your Bash and ZSH alises in Pry."
  spec.version = Pry::VTermAliases::VERSION
  spec.email = ["envygeeks@gmail.com"]
  spec.authors = ["Jordon Bedwell"]
  spec.name = "pry-vterm_aliases"
  spec.licenses = ["MIT"]
  spec.require_paths = ["lib"]
  spec.homepage = "https://github.com/envygeeks/pry-vterm_aliases"
  spec.files = ["Readme.md", "Rakefile", "License", "Gemfile"] + Dir["lib/**/*"]

  # --------------------------------------------------------------------------
  # Dependencies.
  # --------------------------------------------------------------------------

  spec.add_dependency("pry")
  spec.add_development_dependency("rspec", "~> 2.14")
  spec.add_development_dependency("rspec-expect_error", "~> 0.0.2")
end
