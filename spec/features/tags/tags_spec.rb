require 'spec_helper'

feature 'Tags' do
  scenario 'should be able to be created' do
    login_user_via_github
    navigate_to_tags_index
    add_a_tag
    verify_tag_was_added
  end

  scenario 'should be able to be see a list of items with a count' do
    login_user_via_github
    tags = create_tags_with_mapped_values(3)
    navigate_to_tags_index
    verify_tags_are_listed_in_table(tags)
  end

  scenario 'can only be edited from logged in users' do
    navigate_to_tags_index
    verify_user_does_not_have_access
  end
end

def create_tags_with_mapped_values(tag_count = 2)
  tags = create_list(:tag, tag_count)
  tags.each_with_index do |tag, i|
    create_list(:mapped_value, i, tag: tags[0])
  end

  tags
end

def navigate_to_tags_index
    visit root_url
    click_link 'Tags'
end

def verify_tags_are_listed_in_table(tags)
  within 'table.table' do
    tags.each do |tag|
      page.find('tr', text: tag.name).should have_content tag.mapped_values.count
    end
  end
end

def add_a_tag
  click_link 'Add Tag'
  fill_in 'Tag Name', with: 'first-tag'
  click_button 'Add Tag'
end

def verify_tag_was_added
  page.should have_content 'Added tag first-tag'
end
