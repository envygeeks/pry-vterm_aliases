module RSpec
  module Helpers
    module Pry
      module VTermAliasesHelpers
        def stub_grave_commands
          ::Pry::VTermAliases.stub(:`).and_return do |cmd|
            if cmd !~ /^(?:bash|zsh)\s-ic\s'alias'/
              Kernel.send(:`, cmd)
            else
              "ls='ls --color=auto'"
            end
          end
        end
      end
    end
  end
end

RSpec.configure do |config|
  config.include RSpec::Helpers::Pry::VTermAliasesHelpers
end
