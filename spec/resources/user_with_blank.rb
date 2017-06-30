require 'active_model/validations'

class UserWithBlank
  include ActiveModel::Validations

  attr_accessor :profile

  validates :profile, :profile => {:type => :github, :allow_blank => true}
end
