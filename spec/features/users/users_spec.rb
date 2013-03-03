require 'spec_helper'

feature 'A user' do
  scenario 'should be able to login via a github oauth endpoint' do
    login_user_via_github('username')
    verify_user_is_logged_in('username')
  end

  scenario 'should not be able to login if they are invalid' do
    login_user_with_invalid_credentials
    verify_user_had_invalid_credentials
  end

  scenario 'needs to be authorized to login' do
    login_unauthorized_user
    verify_login_failed
  end

  scenario 'should be able to logout' do
    login_user_via_github
    visit root_url
    click_link 'Log out'
    page.should have_content "You have successfully logged out"
    page.should have_content "Login via Github"
  end
end

def verify_user_is_logged_in(username)
  page.should have_content "Successfully logged in #{username}"
end

def verify_user_had_invalid_credentials
  page.should have_content 'Invalid Credentials'
end
