require 'spec_helper'

RSpec.describe Introflection::ModuleSpace::ModuleUnit do
  class C0; end
  class C1 < C0; end
  module IncludeMe; end
  module M1; end
  C1.include(IncludeMe)
  klass = Class.new
  class InheritsFromAnonymous < klass;  end

  describe "#type" do
    context "given a class" do
      subject { described_class.new(C1) }
      it "returns the module's type" do
        expect(subject.type).to eq(:class)
      end
    end

    context "given a module" do
      subject { described_class.new(M1) }
      it "returns the module's type" do
        expect(subject.type).to eq(:module)
      end
    end
  end

  describe "#origin" do
    context "given a core module" do
      subject { described_class.new(RubyVM) }
      it "detects it as a core module" do
        expect(subject.origin).to eq(:core)
      end
    end

    context "given an stdlib module" do
      require 'abbrev'
      subject { described_class.new(Abbrev) }
      it "detects it as an stdlib module" do
        expect(subject.origin).to eq(:stdlib)
      end
    end

    context "given an stdlib module" do
      subject { described_class.new(RSpec) }
      it "detects it as a user-defined module" do
        expect(subject.origin).to eq(:user)
      end
    end
  end

  describe "#nesting_level" do
    subject { described_class.new(described_class) }
    it "returns the nesting level of the module" do
      expect(subject.nesting_level).to eq(3)
    end
  end

  describe "#inherits_from" do
    context "given a module" do
      subject { described_class.new(M1) }
      it "returns nil" do
        expect(subject.inherits_from).to be_nil
      end
    end

    context "given a class" do
      subject { described_class.new(C1) }
      it "returns the superclass' name" do
        expect(subject.inherits_from).to eq(:C0)
      end
    end

    context "given a class without a superclass" do
      subject { described_class.new(BasicObject) }
      it "returns nil" do
        expect(subject.inherits_from).to be_nil
      end
    end

    context "inherits from an anonymous class" do
      subject { described_class.new(InheritsFromAnonymous) }
      it "returns its inspect since it doesn't have a name" do
        expect(subject.inherits_from).to match(/#<Class.+>/)
      end
    end
  end

  describe "#nested_under" do
    context "a module has parents" do
      subject { described_class.new(described_class) }
      it "returns the chain of modules that are parent to the given module" do
        expect(subject.nested_under)
          .to eq(['Introflection::ModuleSpace', 'Introflection', 'Object'])
      end
    end

    context "a module doesn't have parents" do
      subject { described_class.new(Object) }
      it "returns nil" do
        expect(subject.nested_under).to be_nil
      end
    end
  end

  describe "#included_mods" do
    subject { described_class.new(C1) }
    it "shows the modules included into the given module" do
      # Since we depend on Pry, it might use PrettyPrint, and a PP's module
      # is included into the global chain.
      if defined?(PP::ObjectMixin)
        expect(subject.included_mods)
          .to eq(['IncludeMe', 'PP::ObjectMixin', 'Kernel'])
      else
        expect(subject.included_mods).to eq(['IncludeMe', 'Kernel'])
      end
    end
  end
end
