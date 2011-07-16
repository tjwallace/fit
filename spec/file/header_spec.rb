require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Fit::File::Header do
  context "given a sample FIT header" do
    subject do
      described_class.read support_file('samples/file/header')
    end

    its(:header_size) { should == 12 }
    its(:protocol_version) { should == 16 }
    its(:profile_version) { should == 64 }
    its(:data_size) { should == 36069 }
    its(:data_type) { should == ".FIT" }
  end
end
