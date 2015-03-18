require 'spec_helper'

RSpec.describe Introflection::ModuleSpace do
  describe "#each_module" do
    before do
      @modspace = described_class.new
    end

    it "iterates over each module inside the space" do
      mods = []
      @modspace.each_module { |mod| mods << mod }
      expect(mods.all? { |m| m.is_a?(described_class::ModuleUnit) }).to be_truthy
    end

    it "memoizes modules" do
      expect {
        @modspace.each_module { |mod| mod }
      }.to change {
        @modspace.instance_variable_get(:@modspace)
      }
    end

    it "skips over anonymous modules" do
      mods = []
      @modspace.each_module { |mod| mods << mod }
      expect(mods.all? { |m| Object.const_defined?(m.name) }).to be_truthy
    end
  end
end
