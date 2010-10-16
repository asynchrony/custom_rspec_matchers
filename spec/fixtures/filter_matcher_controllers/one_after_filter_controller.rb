class OneAfterFilterController < ActionController::Base
  after_filter :one_after_filter
end