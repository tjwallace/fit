# frozen_string_literal: true

require 'spec_helper'

describe Fit::File::RecordHeader do
  context 'with a sample normal header' do
    subject { described_class.read example_file('record/normal_header') }

    it {
      is_expected.to have_attributes(header_type: 0, message_type: 1, message_type_specific: 0, local_message_type: 0)
    }

    it { is_expected.to be_normal }
    it { is_expected.not_to be_a_compressed_timestamp }
    it { is_expected.not_to be_developer_data }
  end

  # TODO
  # context 'with a sample compressed timestamp header'

  context 'with a sample normal header with developer flag set' do
    subject { described_class.read example_file('record/normal_header_with_developer_flag') }

    it {
      is_expected.to have_attributes(header_type: 0, message_type: 1, message_type_specific: 1, local_message_type: 0)
    }

    it { is_expected.to be_normal }
    it { is_expected.not_to be_a_compressed_timestamp }
    it { is_expected.to be_developer_data }
  end
end
