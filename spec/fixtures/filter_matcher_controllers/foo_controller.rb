class FooController < ActionController::Base
  before_filter :for_all_methods
  after_filter :for_all_methods

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