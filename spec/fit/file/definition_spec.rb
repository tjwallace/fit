# frozen_string_literal: true

require 'spec_helper'

describe Fit::File::Definition do
  context 'given a sample definition message' do
    describe '.read' do
      subject do
        described_class.read example_file('record/message/definition')
      end

      its(:architecture) { is_expected.to eq(0) }
      its(:global_message_number) { is_expected.to eq(0) }
      its(:field_count) { is_expected.to eq(6) }
      it { expect(subject.fit_fields.size).to eq(subject.field_count) }

      its(:record_type) { is_expected.to eq(:definition) }

      it 'returns the real type for fields' do
        expect(subject.fit_fields[0].real_type).to be == :uint32z
        expect(subject.fit_fields[1].real_type).to be == :date_time
        expect(subject.fit_fields[2].real_type).to be == :manufacturer
        expect(subject.fit_fields[3].real_type).to be == :uint16 # product
        expect(subject.fit_fields[4].real_type).to be == :uint16 # number
        expect(subject.fit_fields[5].real_type).to be == :file
      end
    end
  end
end
