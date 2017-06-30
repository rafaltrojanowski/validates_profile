class FacebookUser < ActiveRecord::Base
  self.table_name = "users"

  validates_profile :profile, :type => :facebook
end
