$:.unshift File.dirname(__FILE__) and require 'pry'
unless defined? Pry::Plugins
  Pry.const_set(:Plugins, Class.new)
end

class Pry::Plugins::VTerm
  class << self
    def version
      '0.0.1'
    end

    def aliases
      return @@aliases || {}
    end
  end
end

case ENV['SHELL']
  when '/bin/bash' then require 'pry/aliases/bash'
end