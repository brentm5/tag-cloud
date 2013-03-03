class User < ActiveRecord::Base
  validates :email, uniqueness: { case_sensative: false }

 def self.find_or_create_from_auth_hash(auth = {})
   User.find_by_email(auth.uid)
 end
end
