require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Fit::Record::Header do
  context "given a sample normal header" do
    subject do
      described_class.read support_file('samples/record/normal_header')
    end

    its(:header_type) { should == 0 }
    its(:message_type) { should == 1 }
    its(:local_message_type) { should == 0 }

    it { should be_normal }
    it { should_not be_a_compressed_timestamp }
  end

  context "given a sample compressed timestamp header" do
    # TODO
  end
end
