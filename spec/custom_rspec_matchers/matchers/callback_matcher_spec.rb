require 'spec_helper'

describe 'CallbackMatcher' do
  before do
    @type = :save
    @on = :before
    @method = :method
    @to = CustomRspecMatchers::Matchers::CallbackMatcher.new(@on, @type, @method)
  end
  
  it 'should have default description text' do
    @to.description.should == "have before_save :method"
  end

  # TODO: Failure message is now only set once something has failed. Really need to flush out these tests as time permits.
  #it { @to.failure_message.should == " expected to have #{@on}_#{@type} callback on #{@method}" }
end
