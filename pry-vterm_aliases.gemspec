require File.expand_path("../lib/pry-vterm_aliases", __FILE__)

Gem::Specification.new do |spec|
  spec.version = Pry::Plugins::VTerm.version
  spec.email = ["jordon@envygeeks.com"]
  spec.authors = ["Jordon Bedwell"]
  spec.name = "pry-vterm_aliases"
  spec.files = Dir["**/*"]
  spec.licenses = ["MIT"]
  spec.require_paths = ["lib"]
  spec.add_dependency("pry", "~> 0.9.8")
  spec.summary = "Enable your Bash and ZSH alises in Pry."
  spec.description = "Enable your Bash and ZSH alises in Pry."
  spec.homepage = "http://envygeeks.com/projects/pry-vterm_aliases/"
end
