# frozen_string_literal: true

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
        Fit::File::Definitions.add_field 2, 2, "field_array", type: 6, scale: 10, offset: 0
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
        expect(@result.raw_field_array).to be == [ 123456789, 987654321 ]
        expect(@result.raw_field_4).to be == [ 1, 3 ]
        expect(@result.raw_field_8).to be == 1539
        expect(@result.raw_active_time_zone).to be == 0
      end

      it "does not apply the scale equal to 1 for integer" do
        expect(@result.raw_active_time_zone).to be == 0
        expect(@result.active_time_zone.to_s).to be_eql '0'
      end

      it "does not apply the scale equal to 1 for arrays" do
        expect(@result.raw_field_4).to be == [ 1, 3 ]
        expect(@result.field_4.to_s).to be_eql '[1, 3]'
      end

      it "does apply scale on each element of an array" do
        expect(@result.raw_field_array).to be == [ 123456789, 987654321 ]
        expect(@result.field_array.to_s).to be_eql '[12345678.9, 98765432.1]'
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
        expect(@result.raw_product).to be == 1499
        expect(@result.product).to be == 'swim'
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
        expect(@result.raw_type).to be == 1
        expect(@result.type).to be == 'device'
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
          expect(res.raw_flags).to eq(2)
          expect(res.flags).to eq('read')
        end
      end

      context 'when several bits set' do
        it 'returns the compound value' do
          res = @definition.read( example_file('record/message/data_file_capabilities_settings.fit') )
          expect(res.raw_flags).to eq(6)
          expect(res.flags).to eq('read/write')
        end
      end
    end

    context 'definition with undocumented fields of garmin swim' do

      context 'in lap message' do
        before :each do
          def_file = example_file('record/message/definition_lap.fit')
          definition = described_class.generate(Fit::File::Definition.read def_file)
          @res = definition.read( example_file('record/message/data_lap.fit') )
        end
        it 'returns the total_swim_time' do
          expect(@res.raw_swim_time).to eq(234321)
          expect(@res.swim_time).to eq(234.321)
        end

        it 'returns the average_stroke' do
          expect(@res.raw_average_stroke).to eq(143)
          expect(@res.average_stroke).to eq(14.3)
        end

        it 'returns the swolf' do
          expect(@res.raw_swolf).to eq(49)
          expect(@res.swolf).to eq(49)
        end
      end

      context 'in session message' do
        before :each do
          def_file = example_file('record/message/definition_session.fit')
          definition = described_class.generate(Fit::File::Definition.read def_file)
          @res = definition.read( example_file('record/message/data_session.fit') )
        end

        it 'returns the length_count' do
          expect(@res.raw_length_count).to eq(28)
          expect(@res.length_count).to eq(28)
        end

        it 'returns the total_swim_time' do
          expect(@res.raw_total_swim_time).to eq(1346975)
          expect(@res.total_swim_time).to eq(1346.975)
        end

        it 'returns the average_stroke' do
          expect(@res.raw_average_stroke).to eq(134)
          expect(@res.average_stroke).to eq(13.4)
        end

        it 'returns the swolf' do
          expect(@res.raw_swolf).to eq(44)
          expect(@res.swolf).to eq(44)
        end
      end
    end
  end
end
