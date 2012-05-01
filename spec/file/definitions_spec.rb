require 'spec_helper'

describe Fit::File::Definitions do
  describe ".add_field" do
    context "without additional options" do
      it "adds field data" do
        described_class.add_field(20,5, 'distance')

        described_class.get_field(20,5).should be_a(Hash)
        described_class.get_field(20,5).should eql({ :name => 'distance'})
      end
    end

    context "with additional options" do
      it "adds field data" do
        described_class.add_field(20,5, 'distance', :scale => 100, :units => 'm')

        described_class.get_field(20,5).should be_a(Hash)
        described_class.get_field(20,5).should eql({ :name => 'distance', :scale => 100, :units => 'm'})
      end
    end
  end

  describe ".get_field" do
    it "returns nil if no field exists" do
      described_class.get_field(100,100).should be_nil
    end
  end

  describe ".add_name" do
    it "adds a name" do
      described_class.add_name(20, 'record')
      described_class.get_name(20).should eql('record')
    end
  end

  describe ".get_name" do
    it "returns nil if no name exists" do
      described_class.get_name(100).should be_nil
    end
  end
end
