# frozen_string_literal: true

require 'spec_helper'

describe Fit::File::Header do
  context "given a sample FIT header" do
    subject do
      described_class.read example_file('file/header')
    end

    its(:header_size) { should == 12 }
    its(:protocol_version) { should == 16 }
    its(:profile_version) { should == 64 }
    its(:data_size) { should == 36069 }
    its(:data_type) { should == ".FIT" }
  end

  context "given a sample header file of 14 bytes length" do
    subject do
      described_class.read example_file('file/header_14b.fit')
    end

    its(:header_size) { should == 14 }
    its(:protocol_version) { should == 16 }
    its(:profile_version) { should == 411 }
    its(:data_size) { should == 325 }
    its(:data_type) { should == ".FIT" }
    its(:crc) { should == 17101 }
  end
end
