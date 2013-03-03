require 'spec_helper'

feature 'A mapped Value' do
  scenario 'should be able to be created' do
    login_user_via_github
    create_tag
    navigate_to_add_value
    add_a_mapped_value
    verify_value_was_added
    verify_current_page_is_add_form
  end

  scenario 'should validate input' do
    login_user_via_github
    navigate_to_add_value
    add_an_incomplete_mapped_value
    verify_current_page_is_add_form
    verify_page_has_error
  end

  scenario 'can only be edited from logged in users' do
    navigate_to_add_value
    verify_user_does_not_have_access
  end
end

def create_tag
  create(:tag, name: 'tag-1')
end

def navigate_to_add_value
  visit root_url
  click_link 'New Value'
end

def add_a_mapped_value
  select 'tag-1', from: 'Tag'
  fill_in 'Value', with: 'My Value'
  click_button 'Add Value'
end

def add_an_incomplete_mapped_value
  click_button 'Add Value'
end

def verify_page_has_error
  page.should have_content 'can\'t be blank'
end

def verify_value_was_added
  within 'div.alert' do
    page.should have_content 'You have added a new value for tag-1'
  end
end

def verify_current_page_is_add_form
  page.should have_content 'Add a new Value'
end
