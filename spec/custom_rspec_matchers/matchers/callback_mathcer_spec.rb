require 'spec_helper'

describe 'CallbackMatcher' do
  before do
    @bar = Ohno.new
    @type = :save
    @on = :before
    @method = :method
    @to = CustomRspecMatchers::Matchers::CallbackMatcher.new(@on, @type, @method)
  end
  it { @to.description.should == " has #{@on}_#{@type} callback #{@method}"}
end