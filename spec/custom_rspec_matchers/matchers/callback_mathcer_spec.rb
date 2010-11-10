require 'spec_helper'

describe 'CallbackMatcher' do
  before do
    @bar = Ohno.new
    @type = :save
    @on = :before
    @method = :method
    @to = CustomRspecMatchers::Matchers::CallbackMatcher.new(@on, @type, @method)
  end
  it { @to.description.should == " has #{@on}_#{@type} callback on #{@method}"}
  it { @to.failure_message.should == " expected to have #{@on}_#{@type} callback on #{@method}" }
end