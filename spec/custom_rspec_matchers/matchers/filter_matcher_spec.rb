require 'spec_helper'

class FooController < ActionController::Base
  before_filter :before_for_all_methods
  after_filter :after_for_all_methods

  after_filter :after_filter_only_create, :only => :create
  after_filter :after_filter_only_show, :only => :show
  after_filter :after_filter_only_show_and_create, :only => [:show, :create]
  after_filter :after_filter_except_show, :except => :show
  after_filter :after_filter_except_create, :except => :create
  after_filter :after_filter_except_show_and_create, :except => [:show, :create]

  before_filter :before_filter_only_create, :only => :create
  before_filter :before_filter_only_show, :only => :show
  before_filter :before_filter_only_show_and_create, :only => [:show, :create]
  before_filter :before_filter_except_show, :except => :show
  before_filter :before_filter_except_create, :except => :create
  before_filter :before_filter_except_show_and_create, :except => [:show, :create]
end

class BarController < ActionController::Base ; end

describe 'FilterMatcher' do
  before do
    @foo = FooController.new
    @to = CustomRspecMatchers::Matchers::FilterMatcher.new :before, :before_for_all_methods
    @bar = BarController.new
  end
  
  it { @to.description.should == "include before filter: before_for_all_methods" }
  it { @to.matches?(@foo).should == true }
  it { @foo.should include_before_filter(:before_for_all_methods) }
  
  describe 'failure message' do
    before do
      @to.matches?(@bar)
    end
    it { @to.failure_message.should == " expected to include before filter before_for_all_methods but not found in []" }
  end
end
