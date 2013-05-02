require 'spec_helper'

feature 'A mapped Value' do
  scenario 'can only be edited from logged in users' do
    navigate_to_add_value
    verify_user_does_not_have_access
  end

  scenario 'should be able to be created' do
    login_user_via_github
    tag = create_tag
    navigate_to_add_value
    add_a_mapped_value(tag)
    verify_value_was_added(tag)
    verify_current_page_is_add_form
  end

  scenario 'should be able to be deleted' do
    login_user_via_github
    mapped_value = create_mapped_value
    navigate_to_tag(mapped_value.tag)
    delete_mapped_value
    verify_mapped_value_deleted(mapped_value)
  end

  scenario 'should be able to be edited' do
    login_user_via_github
    mapped_value = create_mapped_value
    navigate_to_tag(mapped_value.tag)
    edit_mapped_value('Here is my new value')
    verify_value_was_edited('Here is my new value')
  end

  scenario 'should validate input when created' do
    login_user_via_github
    navigate_to_add_value
    add_an_incomplete_mapped_value
    verify_current_page_is_add_form
    verify_page_has_error
  end

  scenario 'should validate input when updated' do
    login_user_via_github
    mapped_value = create_mapped_value
    navigate_to_tag(mapped_value.tag)
    enter_invalid_data
    verify_page_has_error
  end
end

def edit_mapped_value(new_value)
  click_link 'Edit'
  page.should have_content 'Edit Value'
  fill_in 'Value', with: new_value
  click_button 'Save Value'
end

def verify_value_was_edited(new_value)
  within 'div.alert' do
    page.should have_content 'Value has been updated'
  end
  page.should have_content new_value
end

def enter_invalid_data
  edit_mapped_value('')
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
  create(:tag)
end

def navigate_to_add_value
  visit root_url
  click_link 'New Value'
end

def add_a_mapped_value(tag)
  select tag.name, from: 'Tag' if tag
  fill_in 'Value', with: 'My Value'
  click_button 'Add Value'
end

def add_an_incomplete_mapped_value
  click_button 'Add Value'
end

def verify_page_has_error
  page.should have_content 'can\'t be blank'
end

def verify_value_was_added(tag)
  within 'div.alert' do
    page.should have_content "You have added a new value for #{tag.name}"
  end
end

def verify_current_page_is_add_form
  page.should have_content 'Add a new Value'
end
