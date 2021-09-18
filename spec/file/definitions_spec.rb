require 'spec_helper'

# we use undefined numbers for field otherwise we interfere
# with already defined fields in definitions.rb and test are
# not really independant of the code
describe Fit::File::Definitions do
  describe ".add_field" do
    before :all do
      @fields = described_class.class_variable_get :@@fields
      @dyn_fields = described_class.class_variable_get :@@dyn_fields
    end

    after :all do
      Fit::File::Definitions.class_variable_set(:@@fields, @fields)
      Fit::File::Definitions.class_variable_set(:@@dyn_fields, @dyn_fields)
    end

    context "without additional options" do
      before :each do
        Fit::File::Definitions.class_variable_set(:@@fields, Hash.new { |h, k| h[k]={} })
        Fit::File::Definitions.class_variable_set(:@@dyn_fields, Hash.new { |h, k| h[k]={} })
        described_class.add_field(999, 999, 'rspec_test')
      end

      it "adds field data" do
        expect(described_class.get_field(999, 999)).to be_a(Hash)
        expect(described_class.get_field(999, 999)).to eql({ name: 'rspec_test' })
      end

      it 'raised an error for dynamic field data' do
        expect { described_class.add_field(999, 999, 'rspec_test_dyn') }.to raise_error(RuntimeError)
      end
    end

    context "with additional options" do
      before :each do
        Fit::File::Definitions.class_variable_set(:@@fields, Hash.new { |h, k| h[k]={} })
        Fit::File::Definitions.class_variable_set(:@@dyn_fields, Hash.new { |h, k| h[k]={} })

        described_class.add_field(999, 999, 'rspec_test', scale: 100, units: 'm')
        described_class.add_field(999, 999, 'rspec_test_dyn', type: 4, scale: 10, offset: 10, ref_field_name: nil, ref_field_values: nil)
      end

      it "adds field data" do
        expect(described_class.get_field(999, 999)).to be_a(Hash)
        expect(described_class.get_field(999, 999)).to eql({ name: 'rspec_test', scale: 100, units: 'm' })
      end
      
      it 'adds dynamic field data' do
        expect(described_class.get_dynamic_fields(999, 999)).to be_a(Hash)
        expect(described_class.get_dynamic_fields(999, 999)).to eql({ rspec_test_dyn: { type: 4, scale: 10, offset: 10, ref_field_name: nil, ref_field_values: nil } })
      end
    end
  end

  describe ".get_field" do
    it "returns nil if no field exists" do
      expect(described_class.get_field(100, 100)).to be_nil
    end
  end

  describe '.get_dynamic_field' do
    it 'returns nil if no dynamic field exists' do
      described_class.add_field(100, 100, 'rspec')
      expect(described_class.get_dynamic_fields(100, 100)).to be_nil
    end
  end

  describe ".add_name" do
    it "adds a name" do
      described_class.add_name(20, 'record')
      expect(described_class.get_name(20)).to eql('record')
    end
  end

  describe ".get_name" do
    it "returns nil if no name exists" do
      expect(described_class.get_name(100)).to be_nil
    end
  end
end
