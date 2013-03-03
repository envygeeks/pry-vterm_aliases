require "simplecov"
SimpleCov.start

require "pry-vterm_aliases"
require "rspec"

def stub_grave_commands
  Pry::VTermAliases.stub(:`).and_return do |cmd|
    if cmd !~ /^(?:bash|zsh)\s-ic\s'alias'/
      Kernel.send(:`, cmd)
    else
      "ls='ls --color=auto'"
    end
  end
end
