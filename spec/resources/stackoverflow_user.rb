class StackoverflowUser < ActiveRecord::Base
  self.table_name = "users"

  validates_profile :profile, :type => :stackoverflow
end
