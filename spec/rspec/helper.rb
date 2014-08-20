require_relative "../support/simplecov.rb"
require "luna/rspec/formatters/checks"
require "pry-vterm_aliases"
require "rspec"

Dir[File.expand_path("../../support/**/*.rb", __FILE__)].each do |f|
  require f
end
