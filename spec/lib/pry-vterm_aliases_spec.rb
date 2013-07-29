require "rspec/helper"

describe Pry::VTermAliases do
  subject { Pry::VTermAliases }

  describe Pry::VTermAliases::ObjectExt do
    describe "#capture_vterm_alias" do
      it "should return the output of the command" do
        stub_grave_commands
        expect(capture_vterm_alias("ls", "Gemfile")).to eq "Gemfile\n"
      end
    end
  end

  it "returns a blank hash for aliases if no shell is defined" do
    @aliases = subject.send(:remove_instance_variable, :@aliases)
    @shell = subject.instance_variable_get(:@shell)
    subject.instance_variable_set(:@shell, "")

    expect(subject.aliases).to be_instance_of Hash

    subject.instance_variable_set(:@shell, @shell)
    subject.instance_variable_set(:@aliases, @aliases)
  end

  it "gives a list of aliases if asked" do
    expect(subject.aliases.count).to be > 0
  end

  it "raises if an alias is unknown" do
    expect_error ArgumentError do
      subject.run_alias("hello", "")
    end
  end

  it "runs aliases as asked" do
    stub_grave_commands
    expect(subject.run_alias("ls", "Gemfile", out = StringIO.new)).to eq true
    out.string.should eq("Gemfile\n")
  end
end
