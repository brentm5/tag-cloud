require 'spec_helper'

feature 'A mapped Value' do
  scenario 'can only be edited from logged in users' do
    navigate_to_add_value
    verify_user_does_not_have_access
  end

  scenario 'should be able to be created' do
    login_user_via_github
    create_tag
    navigate_to_add_value
    add_a_mapped_value
    verify_value_was_added
    verify_current_page_is_add_form
  end

  scenario 'should be able to be deleted' do
    login_user_via_github
    mapped_value = create_mapped_value
    navigate_to_tag(mapped_value.tag)
    delete_mapped_value
    verify_mapped_value_deleted(mapped_value)
  end

  scenario 'should validate input' do
    login_user_via_github
    navigate_to_add_value
    add_an_incomplete_mapped_value
    verify_current_page_is_add_form
    verify_page_has_error
  end
end

def navigate_to_tag(tag)
  visit tags_path
  click_link tag.name
end

def delete_mapped_value
  within 'table.table' do
    click_link 'Delete Value'
  end
end

def verify_mapped_value_deleted(mapped_value)
  within 'div.alert' do
    page.should have_content 'Successfully deleted value'
  end
  within 'table.table' do
    page.should_not have_content mapped_value.value
  end
end

def create_mapped_value
  create(:mapped_value)
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
