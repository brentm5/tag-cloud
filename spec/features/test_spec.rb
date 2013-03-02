require 'spec_helper'

feature 'Tag-Cloud' do
  scenario 'Should load a welcome page' do
    visit root_url
    within 'a.brand' do
      page.should have_content 'Tag-Cloud'
    end
    within 'div.hero-unit' do
      page.should have_content 'Welcome to Tag-Cloud'
    end
  end
end
