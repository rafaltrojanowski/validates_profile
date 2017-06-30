class UserWithAr < ActiveRecord::Base
  self.table_name = "users"

  validates :profile, :profile => { :type => :github }
end
