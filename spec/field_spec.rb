require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Fit::Field do

  let(:with_all) { described_class.new(150, :name => 'foo', :scale => 10, :units => 's') }
  let(:without_scale) { described_class.new(150, :name => 'foo', :units => 's') }

  describe "#value_raw" do
    it "returns unscaled value" do
      with_all.value_raw.should == 150
    end
  end

  describe "#value" do
    it "returns scaled value" do
      with_all.value.should == 15
      without_scale.value.should == 150
    end
  end

  describe "#scale" do
    it "returns :scale option" do
      with_all.scale.should == 10
    end

    it "defaults to 1" do
      without_scale.scale.should == 1
    end
  end

  describe "#to_s" do
    it "includes units" do
      with_all.to_s.should match(/#{with_all.units}/)
    end
  end
end
