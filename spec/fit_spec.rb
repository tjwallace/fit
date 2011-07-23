require 'spec_helper'

describe Fit do
  describe "VERSION" do
    subject{ Fit::VERSION }

    it { should be_a(String) }
    it { should match(/\d{1,2}\.\d{1,2}\.\d{1,2}/) }
  end

  describe ".load_file" do
    let(:path) { example_file('activity.fit') }

    it "should load a fit file given a path" do
      described_class.load_file(path).should be_a(Fit::File)
    end
  end
end
