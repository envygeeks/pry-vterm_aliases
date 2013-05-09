unless %W(no false).include?(ENV["COVERAGE"])
  require "simplecov"
  require "coveralls"

  module Coveralls
    NoiseBlacklist = [
      "[Coveralls] Using SimpleCov's default settings.".green,
      "[Coveralls] Set up the SimpleCov formatter.".green,
      "[Coveralls] Outside the Travis environment, not sending data.".yellow
    ]

    def puts(message)
      # Only prevent the useless noise on our terminals, not inside of the Travis or Circle CI.
      unless NoiseBlacklist.include?(message) || ENV["TRAVIS"] == "true" || ENV["CI"] == "true"
        $stdout.puts message
      end
    end
  end

  SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
    SimpleCov::Formatter::HTMLFormatter,
        Coveralls::SimpleCov::Formatter
  ]

  Coveralls.noisy = true
  SimpleCov.start do
    add_filter "/spec/"
  end
end

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
