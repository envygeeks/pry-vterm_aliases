# -*- encoding: utf-8 -*-

Gem::Specification.new do |spec|
  spec.name = "pry-vterm_aliases"
  spec.version = "0.0.1"
  spec.platform = "linux"

  if spec.respond_to? :required_rubygems_version
    spec.required_rubygems_version = Gem::Requirement.new(">= 0")
  end

  spec.authors = ["Jordon Bedwell"]
  spec.date = "2012-02-11"
  spec.description = "Preserve your VTerm aliases in Pry."
  spec.email = ["jordon@envygeeks.com"]
  
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
  
  spec.homepage = "https://github.com/envygeeks/pry-bash_aliases"
  spec.licenses = ["MIT"]
  spec.require_paths = ["lib"]
  spec.rubygems_version = "1.8.15"
  spec.summary = "Preserve your VTerm aliases in Pry."

  if spec.respond_to? :specification_version
    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      spec.specification_version = 3
      spec.add_runtime_dependency(%q<pry>, ["~> 0.9.8"])
    end
  else
    spec.add_dependency(%q<pry>, ["~> 0.9.8"])
  end
end
