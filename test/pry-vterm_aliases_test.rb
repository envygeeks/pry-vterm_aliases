$:.unshift(File.expand_path("../../lib", __FILE__))
require "simplecov"

unless ENV["COVERAGE"] == false
  SimpleCov.command_name("minitest") and SimpleCov.start
end

require "pry-vterm_aliases"
require "minitest/autorun"
require "minitest/pride"

describe Pry::VTermAliases do
  describe "VERSION" do
    it "should be proper" do
      Pry::VTermAliases::VERSION.must_match(%r!(\d+.)+(.pre\d{1})?!)
    end
  end

  describe ".aliases" do
    describe "shell == nil" do
      it "should output { }" do
        aliases = Pry::VTermAliases.send(:remove_instance_variable, :@aliases)
        shell = Pry::VTermAliases.instance_variable_get(:@shell)
        Pry::VTermAliases.instance_variable_set(:@shell, "")

        Pry::VTermAliases.aliases.must_be_kind_of(Hash)
        Pry::VTermAliases.aliases.must_equal({})

        Pry::VTermAliases.instance_variable_set(:@shell, shell)
        Pry::VTermAliases.instance_variable_set(:@aliases, aliases)
      end
    end

    describe "shell != nil" do
      it "should have a list of aliases" do
        Pry::VTermAliases.aliases.count.must_be(:>, 0)
      end
    end
  end

  describe ".commands" do
    it "should just work" do
      assert(Pry::VTermAliases.run_command(
        Pry::VTermAliases.aliases.first.first, "", out = StringIO.new))
    end

    it "should raise if the alias is unknown" do
      assert_raises(ArgumentError) do
        Pry::VTermAliases.run_command("random128213", "", out = StringIO.new)
      end
    end
  end
end
