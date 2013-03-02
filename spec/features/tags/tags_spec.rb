require 'spec_helper'

feature 'Tags' do
  scenario 'should be able to be created' do
    navigate_to_tags_index
    add_a_tag
    verify_tag_was_added
  end

  scenario 'should be able to be seen in a list view' do
    tags = create_list(:tag, 3)
    navigate_to_tags_index
    verify_tags_are_listed_in_table tags
  end
end

def navigate_to_tags_index
    visit root_url
    click_link 'Tags'
end

def verify_tags_are_listed_in_table(tags)
  within 'table.table' do
    tags.each do |tag|
      page.should have_content tag.name
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
