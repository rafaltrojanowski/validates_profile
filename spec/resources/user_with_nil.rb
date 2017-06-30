require 'active_model/validations'

class UserWithNil
  include ActiveModel::Validations

  attr_accessor :profile

  validates :profile, :profile => { :allow_nil => true, :type => :github }
end
