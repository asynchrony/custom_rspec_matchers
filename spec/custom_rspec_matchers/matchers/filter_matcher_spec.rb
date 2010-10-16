require 'spec_helper'

describe 'FilterMatcher' do
  describe "matcher for a before filter" do
    before do
      @filter_under_test = :some_before_filter
      @matcher = FilterMatcher.new :before, @filter_under_test
    end
    
    it "has the correct description" do
      @matcher.description.should == "include before filter: some_before_filter"
    end
    
    describe "calling matches? on the matcher with a controller that doesn't have any filters" do
      before do
        @test_object = @matcher.matches? NoFiltersController.new
      end
      
      it "returns false" do
        @test_object.should == false
      end
      it "has the correct failure message" do
        @matcher.failure_message.should == " expected to include before filter some_before_filter but not found in []"
      end
    end
    
    describe "calling matches? on the matcher with a controller that doesn't have any before filters" do
      before do
        @test_object = @matcher.matches? OneAfterFilterController.new
      end
      
      it "returns false" do
        @test_object.should == false
      end
      it "has the correct failure message" do
        @matcher.failure_message.should == " expected to include before filter some_before_filter but not found in []"
      end
    end
    
    describe "calling matches? on the matcher with a controller that doesn't have the before filter" do
      before do
        @test_object = @matcher.matches? OneBeforeFilterController.new
      end
      
      it "returns false" do
        @test_object.should == false
      end
      it "has the correct failure message" do
        @matcher.failure_message.should == " expected to include before filter some_before_filter but not found in [:one_before_filter]"
      end
    end
  end
end