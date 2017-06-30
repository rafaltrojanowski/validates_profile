require 'active_model/validations'

class UserWithLegacySyntax
  include ActiveModel::Validations

  attr_accessor :profile

  validates_profile :profile, :type => :github, :allow_blank => true
end
