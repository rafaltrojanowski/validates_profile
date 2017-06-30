class UserWithTypeAsProc < ActiveRecord::Base
  self.table_name = "users"

  validates_profile :profile, :type => Proc.new { |rec| rec.kind }
end
