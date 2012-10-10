require File.expand_path("../lib/pry-vterm_aliases", __FILE__)

Gem::Specification.new do |spec|
  spec.name = "pry-vterm_aliases"
  spec.version = Pry::Plugins::VTerm.version
  spec.email = ["jordon@envygeeks.com"]
  spec.authors = ["Jordon Bedwell"]
  spec.add_dependency("pry", "~> 0.9.8")
  spec.description = "Preserve your VTerm aliases in Pry."
  spec.files = Dir["**/*"]
  spec.homepage = "https://github.com/envygeeks/pry-vterm_aliases"
  spec.licenses = ["MIT"]
  spec.require_paths = ["lib"]
  spec.summary = "Preserve your VTerm aliases in Pry."
end
