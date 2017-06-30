class User
  include ActiveModel::Validations

  attr_accessor :profile

  validates :profile, :profile => { :type => :github, :message => "custom message" }
end
