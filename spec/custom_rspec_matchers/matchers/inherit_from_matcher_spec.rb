require 'spec_helper'

class Foo; end
class Bar < Foo; end

describe 'InheritFromMatcher' do
  before do
    @bar = Bar.new
    @to = CustomRspecMatchers::Matchers::InheritFromMatcher.new(Foo)
  end
  it { @to.description.should == "inherit from #{Foo}"}
  it { @to.matches?(Bar.new).should == true }
  it { @bar.should inherit_from(Foo) }
  describe 'failure message' do
    before do
      @to.matches?(@bar)
    end
    it { @to.failure_message.should == " expected to inherit from #{Foo} but was #{@bar.class.superclass}"}
  end
end
