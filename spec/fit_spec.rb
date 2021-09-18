# frozen_string_literal: true

require 'spec_helper'

describe Fit do
  describe 'VERSION' do
    subject { Fit::VERSION }

    it { is_expected.to be_a(String) & match(/\d{1,2}\.\d{1,2}\.\d{1,2}/) }
  end
end
