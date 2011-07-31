require 'spec_helper'

describe Fit::Logger do
  describe ".logger" do
    subject { described_class.logger }
    it { should be_a(Logging::Logger) }
    it "always return the same logger" do
      l1, l2 = described_class.logger, described_class.logger
      l1.object_id.should eq(l2.object_id)
    end
  end
end
