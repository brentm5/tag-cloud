class GithubAuthorizer 
  def self.GetUserInfo(authorize)
    if authorize
      {
        username: authorize.info.nickname,
        uid: authorize.uid,
        email: authorize.info.email,
        name: authorize.info.name
      }
    end
  end

  def self.AuthorizeUser(user)
    if ENV['GITHUB_ORGANIZATION']
      organizations = GithubAuthorizer.GetOrganizations(user)
      organizations.each do |organization|
        if organization['login'] == ENV['GITHUB_ORGANIZATION']
          return true
        end
      end
    else
      return true
    end

    false
  end

  def self.GetOrganizations(user)
    uri = URI.parse("https://api.github.com/users/#{user.username}/orgs?client_id=#{ENV['GITHUB_KEY']}&client_secret=#{ENV['GITHUB_SECRET']}")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    response = http.request(Net::HTTP::Get.new(uri.request_uri))

    ActiveSupport::JSON.decode(response.body)
  end
end
