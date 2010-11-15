require 'spec_helper'

describe Duck do

  it { should have_after_create_callback(:after_create_callback) }
  it { should have_around_create_callback(:around_create_callback) }
  it { should have_before_create_callback(:before_create_callback) }
  
  it { should have_after_save_callback(:after_save_callback) }
  it { should have_around_save_callback(:around_save_callback) }
  it { should have_before_save_callback(:before_save_callback) }
  
  it { should have_after_update_callback(:after_update_callback) }
  it { should have_around_update_callback(:around_update_callback) }
  it { should have_before_update_callback(:before_update_callback) }

  it { should have_after_validation_callback(:after_validation_callback) }
  it { should have_before_validation_callback(:before_validation_callback) }
  
  it { should have_after_validation_on_create_callback(:after_validation_on_create_callback) }
  it { should have_before_validation_on_create_callback(:before_validation_on_create_callback) }

  it { should have_after_validation_on_update_callback(:after_validation_on_update_callback) }
  it { should have_before_validation_on_update_callback(:before_validation_on_update_callback) }

end