class Duck
  extend ActiveModel::Callbacks
  define_model_callbacks :create, :update, :save, :validation, :validation_on_create, :validation_on_update
  after_create :after_create_callback
  around_create :around_create_callback
  before_create :before_create_callback

  after_save :after_save_callback
  around_save :around_save_callback
  before_save :before_save_callback

  after_update :after_update_callback
  around_update :around_update_callback
  before_update :before_update_callback
  
  before_validation :before_validation_callback
  after_validation :after_validation_callback
  
  before_validation_on_create :before_validation_on_create_callback
  after_validation_on_create :after_validation_on_create_callback

  before_validation_on_update :before_validation_on_update_callback
  after_validation_on_update :after_validation_on_update_callback
  
end