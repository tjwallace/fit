require 'spec_helper'

describe Fit::File::Data do
  describe ".generate" do
    context 'standard definition' do
      let(:definition) do
        Fit::File::Definition.read example_file('record/message/definition')
      end

      subject { described_class.generate(definition) }

      its(:ancestors) { should include(BinData::Record) }
      its("new.record_type") { should eq(:file_id) }
    end

    context 'definition with multiple time the same field' do
      before :all do
        @fields = Fit::File::Definitions.class_variable_get :@@fields
        @dyn_fields = Fit::File::Definitions.class_variable_get :@@dyn_fields
        # force a fake definition for scaling of arrays
        Fit::File::Definitions.add_field 2, 2, "field_array", :type => 6, :scale => 10, :offset => 0
      end

      after :all do
        Fit::File::Definitions.class_variable_set :@@fields, @fields
        Fit::File::Definitions.class_variable_set :@@dyn_fields, @dyn_fields
      end

      before :each do
        def_file = example_file('record/message/definition_field_array.fit')
        data_file = example_file('record/message/data_field_array.fit')
        definition = described_class.generate(Fit::File::Definition.read def_file)
        @result = definition.read( data_file )
      end

      it "reads the entire record" do
        # read first the record definition
        @result.raw_field_array.should == [ 123456789, 987654321 ]
        @result.raw_field_4.should == [ 1, 3 ]
        @result.raw_field_8.should == 1539
        @result.raw_active_time_zone.should == 0
      end
    
      it "does not apply the scale equal to 1 for integer" do
        @result.raw_active_time_zone.should == 0
        @result.active_time_zone.to_s.should be_eql '0'
      end
      
      it "does not apply the scale equal to 1 for arrays" do
        @result.raw_field_4.should == [ 1, 3 ]
        @result.field_4.to_s.should be_eql '[1, 3]'
      end

      it "does apply scale on each element of an array" do
        @result.raw_field_array.should == [ 123456789, 987654321 ]
        @result.field_array.to_s.should be_eql '[12345678.9, 98765432.1]'
      end
    end

    context 'definition with dynamic fields' do
      before :each do
        def_file = example_file('record/message/definition_dynamic_fields.fit')
        data_file = example_file('record/message/data_dynamic_fields.fit')
        definition = described_class.generate(Fit::File::Definition.read def_file)
        @result = definition.read( data_file )
      end

      it 'uses dynamic field value' do
        @result.raw_product.should == 1499
        @result.product.should == 'swim'
      end
    end

    context 'definition with non basic types' do
      before :each do
        def_file = example_file('record/message/definition_dynamic_fields.fit')
        data_file = example_file('record/message/data_dynamic_fields.fit')
        definition = described_class.generate(Fit::File::Definition.read def_file)
        @result = definition.read( data_file )
      end

      it 'returns the real value' do
        @result.raw_type.should == 1
        @result.type.should == 'device'
      end
    end

    context 'definition with bit field types' do
      before :each do
        def_file = example_file('record/message/definition_file_capabilities.fit')
        @definition = described_class.generate(Fit::File::Definition.read def_file)
      end

      context 'when only 1 bit set' do
        it 'returns the single value' do
          res = @definition.read( example_file('record/message/data_file_capabilities_activities.fit') )
          res.raw_flags.should == 2
          res.flags.should == 'read'
        end
      end

      context 'when several bits set' do
        it 'returns the compound value' do
          res = @definition.read( example_file('record/message/data_file_capabilities_settings.fit') )
          res.raw_flags.should == 6
          res.flags.should == 'read/write'
        end
      end
    end
  end
end
