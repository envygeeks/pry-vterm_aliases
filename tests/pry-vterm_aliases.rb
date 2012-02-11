require './lib/pry-vterm_aliases'
require 'minitest/autorun'

describe Pry::Plugins::VTerm do
  it 'should have a proper version number' do
  	# We care whether we have a proper version number yes.....
    Pry::Plugins::VTerm.version.split(/\./).delete_if do |val|
      val =~ /pre\d{0,2}/
    end.length.must_equal 3
  end

  it 'should output a hash of aliases when calling aliases' do
  	# All we care about here is that we get a Hash
  	assert Pry::Plugins::VTerm.aliases.class, Hash
  end
end