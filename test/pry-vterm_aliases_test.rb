$:.unshift(File.expand_path("../../lib", __FILE__))
require "simplecov"

unless ENV["COVERAGE"] == false
  SimpleCov.command_name("minitest") and SimpleCov.start
end

require "pry-vterm_aliases"
require "minitest/autorun"
require "minitest/pride"

describe(Pry::VTermAliases) {
  describe("VERSION") {
    it("should be proper") {
      assert_match(%r!(\d+.)+(.pre\d{1})?!, Pry::VTermAliases::VERSION)
    }
  }

  describe(".aliases") {
    describe("term = nil") {
      it("should output { }") {
        aliases = Pry::VTermAliases.send(:remove_instance_variable, :@aliases)
        term = Pry::VTermAliases.instance_variable_get(:@terminal)
        Pry::VTermAliases.instance_variable_set(:@terminal, "")

        assert_equal({}, Pry::VTermAliases.aliases)

        Pry::VTermAliases.instance_variable_set(:@terminal, term)
        Pry::VTermAliases.instance_variable_set(:@aliases, aliases)
      }
    }

    describe("term != nil") {
      it("should have a list of aliases") {
        assert(Pry::VTermAliases.aliases.count > 0)
      }
    }
  }

  describe(".commands") {
    it("should just work") {
      assert(Pry::VTermAliases.run_command(
        Pry::VTermAliases.aliases.first.first, "", out = StringIO.new))
    }

    it("should raise if the alias is unknown") {
      assert_raises(ArgumentError) {
        Pry::VTermAliases.run_command(
          "random128u2198aj2o", "", out = StringIO.new)
      }
    }
  }
}
