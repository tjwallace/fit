require 'spec_helper'

describe Fit do
  describe "VERSION" do
    subject{ Fit::VERSION }

    it { should be_a(String) }
    it { should match(/\d{1,2}\.\d{1,2}\.\d{1,2}/) }
  end
end
