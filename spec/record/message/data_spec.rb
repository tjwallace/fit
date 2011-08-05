require 'spec_helper'

describe Fit::Record::Message::Data do
  describe ".generate" do
    let(:definition) do
      Fit::Record::Message::Definition.read example_file('record/message/definition')
    end

    subject { described_class.generate(definition) }

    its(:ancestors) { should include(BinData::Record) }
  end

  describe ".read" do
    subject do
      described_class.read example_file('record/message/definition')
    end
  end
end
