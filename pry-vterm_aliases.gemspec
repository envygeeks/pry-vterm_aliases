# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "pry-vterm_aliases"
  s.version = "0.0.1"
  s.platform = "linux"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jordon Bedwell"]
  s.date = "2012-02-11"
  s.description = "Preserve your VTerm aliases in Pry."
  s.email = ["jordon@envygeeks.com"]
  s.files = ["lib/pry", "lib/pry/aliases", "lib/pry/aliases/bash.rb", "lib/pry-vterm_aliases.rb", "readme.md", "license.txt", "rakefile.rb", "gemfile.rb"]
  s.homepage = "https://github.com/envygeeks/pry-bash_aliases"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.15"
  s.summary = "Preserve your VTerm aliases in Pry."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<pry>, ["~> 0.9.8"])
    else
      s.add_dependency(%q<pry>, ["~> 0.9.8"])
    end
  else
    s.add_dependency(%q<pry>, ["~> 0.9.8"])
  end
end
