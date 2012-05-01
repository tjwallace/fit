require 'spec_helper'

describe Fit::File::RecordHeader do
  context "given a sample normal header" do
    subject do
      described_class.read example_file('record/normal_header')
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
