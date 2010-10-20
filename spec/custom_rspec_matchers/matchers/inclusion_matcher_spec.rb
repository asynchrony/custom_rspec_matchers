require 'spec_helper'

module FooMod; end
class Ohno; include FooMod; end

describe 'InclusionMatcher' do
  before do
    @bar = Ohno.new
    @to = CustomRspecMatchers::Matchers::InclusionMatcher.new(FooMod)
  end
  it { @to.description.should == "includes #{FooMod}"}
  it { @to.matches?(Ohno.new).should == true }
  it { @bar.should include_module(FooMod) }
  describe 'failure message' do
    before do
      @to.matches?(@bar)
    end
    it { @to.failure_message.should == " expected to include #{FooMod} but did not"}
  end
end
