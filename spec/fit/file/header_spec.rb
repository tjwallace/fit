# frozen_string_literal: true

require 'spec_helper'

describe Fit::File::Header do
  context 'with a sample FIT header' do
    subject { described_class.read example_file('file/header') }

    it {
      is_expected.to have_attributes(header_size: 12, protocol_version: 16, profile_version: 64, data_size: 36069,
                                     data_type: '.FIT')
    }
  end

  context 'with a sample header file of 14 bytes length' do
    subject { described_class.read example_file('file/header_14b.fit') }

    it {
      is_expected.to have_attributes(header_size: 14, protocol_version: 16, profile_version: 411, data_size: 325,
                                     data_type: '.FIT', crc: 17101)
    }
  end
end
