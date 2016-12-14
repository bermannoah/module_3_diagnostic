require 'rails_helper'

describe "user visits the page" do
  context "a user visits root" do
    scenario "they see a search form" do
      visit '/'

      expect(page).to have_field('navbar-search-field') 
    end
    
    scenario "they enter a zip code in the form" do
      visit '/'
      
      fill_in 'zipcode', with: '80203'
      
      click_button 'Locate'
      expect(page).to have_content 'Stations near 80203'
    end
  end
end