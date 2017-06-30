class UserWithProfiles < ActiveRecord::Base
  self.table_name = "users"

  profile_attr_accessor :github, :facebook, :twitter, :stackoverflow

  validates_profile :github, :type => :github
  validates_profile :facebook, :type => :facebook
  validates_profile :twitter, :type => :twitter
  validates_profile :stackoverflow, :type => :stackoverflow
end
