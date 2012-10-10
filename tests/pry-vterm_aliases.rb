require "./lib/pry-vterm_aliases"
require "minitest/autorun"
require "minitest/pride"

describe Pry::Plugins::VTerm do
  it "should have a proper version number" do
    Pry::Plugins::VTerm.version.split(/\./).delete_if { |val|
      val =~ /pre\d{0,2}/ }.length.must_equal 3
  end

  it "should output a hash of aliases when calling aliases" do
    assert Pry::Plugins::VTerm.aliases.class, Hash
  end
end
