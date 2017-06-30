class UserWithTypeAsSymbol < ActiveRecord::Base
  self.table_name = "users"

  validates_profile :profile, :type => :github
end
