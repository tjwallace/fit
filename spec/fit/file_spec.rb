# frozen_string_literal: true

require 'spec_helper'

describe Fit::File do
  subject(:file) { described_class.read(example_file('file/full_file_with_wrong_crc.fit')) }

  it 'has a header' do
    expect(file.header).to be_a Fit::File::Header
  end

  it 'has records' do
    expect(file.records).to be_a Array
    expect(file.records[0]).to be_a Fit::File::Record
  end

  it 'has a CRC' do
    # warning this file is not having a consistent CRC compare to
    # its content. To be used only for test.
    expect(file.crc).to be_a String
    expect(BinData::Uint16le.read(file.crc)).to be == 34100
  end
end
