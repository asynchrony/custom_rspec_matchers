require 'spec_helper'

describe FooController do
  describe "before all methods filter" do
    it { should include_before_filter(:for_all_methods) }
  end
  describe "after all methods filter" do
    it { should include_after_filter(:for_all_methods) }
  end
  describe "after_filters only create" do
    it { should include_after_filter(:after_filter_only_create).only_on(:create) }
  end
  describe "after_filters only show" do
    it { should include_after_filter(:after_filter_only_show).only_on(:show) }
  end
  describe "after_filters only show and create" do
    it { should include_after_filter(:after_filter_only_show_and_create).only_on([:show, :create]) }
  end
  describe "after_filters only show and create without array" do
    it { should include_after_filter(:after_filter_only_show_and_create).only_on(:show, :create) }
  end
  describe "after_filters only show and create with params flipped" do
    it { should include_after_filter(:after_filter_only_show_and_create).only_on([:create, :show]) }
  end
  describe "after_filters except create" do
    it { should include_after_filter(:after_filter_except_create).except_on(:create) }
  end
  describe "after_filters except show" do
    it { should include_after_filter(:after_filter_except_show).except_on(:show) }
  end
  describe "after_filters except show and create" do
    it { should include_after_filter(:after_filter_except_show_and_create).except_on([:show, :create]) }
  end
  describe "before_filters only create" do
    it { should include_before_filter(:before_filter_only_create).only_on(:create) }
  end
  describe "before_filters only show" do
    it { should include_before_filter(:before_filter_only_show).only_on(:show) }
  end
  describe "before_filters only show and create" do
    it { should include_before_filter(:before_filter_only_show_and_create).only_on([:show, :create]) }
  end
  describe "before_filters except create" do
    it { should include_before_filter(:before_filter_except_create).except_on(:create) }
  end
  describe "before_filters except show" do
    it { should include_before_filter(:before_filter_except_show).except_on(:show) }
  end
  describe "before_filters except show and create" do
    it { should include_before_filter(:before_filter_except_show_and_create).except_on([:show, :create]) }
  end
end