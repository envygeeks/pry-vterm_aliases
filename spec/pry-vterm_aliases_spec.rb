$:.unshift(File.expand_path("../../lib", __FILE__))

if ENV["COVERAGE"] == true
  require "simplecov"
  SimpleCov.start
end

require "pry-vterm_aliases"
require "rspec"

describe Pry::VTermAliases do
  describe "VERSION" do
    it "should be proper" do
      Pry::VTermAliases::VERSION.should match %r!(\d+.)+(.pre\d{1})?!
    end
  end

  describe ".aliases" do
    context "when @shell == nil" do
      before do
        @aliases = Pry::VTermAliases.send(:remove_instance_variable, :@aliases)
        @shell = Pry::VTermAliases.instance_variable_get(:@shell)
        Pry::VTermAliases.instance_variable_set(:@shell, "")
      end

      after do
        Pry::VTermAliases.instance_variable_set(:@shell, @shell)
        Pry::VTermAliases.instance_variable_set(:@aliases, @aliases)
      end

      it "should output { }" do
        Pry::VTermAliases.aliases.should be_instance_of Hash
        Pry::VTermAliases.aliases.should be_empty
      end
    end

    context "when @shell != nil" do
      it "should have a list of aliases" do
        Pry::VTermAliases.aliases.count.should be > 0
      end
    end
  end

  describe ".run_command" do
    it "should raise if the alias is unknown" do
      expect do
        Pry::VTermAliases.run_command("random128213", "", out = StringIO.new)
      end.to raise_error ArgumentError
    end
  end

  describe ".shell commands" do
    before(:each) do
      Pry::VTermAliases.stub(:`).and_return do |cmd|
        if cmd !~ /^(?:bash|zsh)\s-ic\s'alias'/
          Kernel.send(:`, cmd)
        else
          "ls='ls --color=auto'"
        end
      end

      Pry::VTermAliases.send(:remove_instance_variable, :@aliases)
    end

    specify "should just work" do
      Pry::VTermAliases.run_command("ls", "Gemfile", out = StringIO.new)
      out.string.should eq("Gemfile\n")
    end
  end
end
