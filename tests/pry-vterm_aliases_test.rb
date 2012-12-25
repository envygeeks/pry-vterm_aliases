require "./lib/pry-vterm_aliases"
require "minitest/autorun"
require "minitest/pride"

describe(VTermAliases) {
  describe("VERSION") {
    it("should be proper") {
      assert_match(%r!(\d+.)+(.pre\d{1})?!, Pry::Plugins::VTermAliases::VERSION)
    }
  }
}
