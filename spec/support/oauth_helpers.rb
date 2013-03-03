def login_user_via_github(username = 'username')
  set_oauth_test_mode
  disable_github_organization_check
  create(:user, email: username)
  OmniAuth.config.add_mock(:github, {info: { nickname: username} })
  perform_login
end

def login_unauthorized_user(username = 'username')
  set_oauth_test_mode
  create(:user, email: username)
  set_github_organization_check 'goodtimesftw'
  OmniAuth.config.add_mock(:github, {info: { nickname: username} })
  perform_login
end

def login_user_with_invalid_credentials
  set_oauth_test_mode
  OmniAuth.config.mock_auth[:github] = :invalid_credentials
  perform_login
end

def set_oauth_test_mode
  OmniAuth.config.test_mode = true
end

def set_github_organization_check(org)
  ENV['GITHUB_ORGANIZATION'] = org
end

def disable_github_organization_check
  ENV['GITHUB_ORGANIZATION'] = nil
end

def perform_login
  visit root_url
  click_link 'Login via Github'
end

def verify_login_failed
  within 'div.alert' do
    page.should have_content 'Login Failed'
  end
end

def verify_user_does_not_have_access
  within 'div.alert' do
    page.should have_content 'You must be logged in to access this page'
  end
end
