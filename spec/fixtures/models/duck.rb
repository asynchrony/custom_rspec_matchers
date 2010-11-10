class Duck
  extend ActiveModel::Callbacks
  define_model_callbacks :create, :update, :save
  after_create :after_create_callback
  around_create :around_create_callback
  before_create :before_create_callback

  after_save :after_save_callback
  around_save :around_save_callback
  before_save :before_save_callback

  after_update :after_update_callback
  around_update :around_update_callback
  before_update :before_update_callback
  
end