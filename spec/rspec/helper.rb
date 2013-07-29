require_relative "../support/simplecov.rb"
require "luna/rspec/formatters/checks"
require "rspec/expect_error"
require "pry-vterm_aliases"
require "rspec"

Dir[File.expand_path("../../support/**/*.rb", __FILE__)].each do |f|
  require f
end
