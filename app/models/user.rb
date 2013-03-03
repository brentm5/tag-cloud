class User < ActiveRecord::Base
  validates :email, uniqueness: { case_sensative: false }

  def self.find_or_create_from_auth_hash(auth = {})
    info_hash = GithubAuthorizer.GetUserInfo auth
    if info_hash
      user = User.find_by_uid(info_hash[:uid])
      unless user
        user = User.create(info_hash)
      end
      GithubAuthorizer.AuthorizeUser user
      return user
    end
 end
end
