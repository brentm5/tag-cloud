def login_user_via_github(email = 'e@mail.com')
  set_oauth_test_mode
  create(:user, email: email)
  OmniAuth.config.add_mock(:github, {uid: email })
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

def perform_login
  visit root_url
  click_link 'Login via Github'
end

