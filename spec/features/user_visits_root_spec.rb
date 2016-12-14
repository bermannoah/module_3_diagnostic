require 'rails_helper'

describe "user visits the page" do
  context "a user visits root" do
    scenario "they see a search form" do
      visit '/'

      expect(page).to have_field('navbar-search-field') 
    end
    
    xscenario "they enter a zip code in the form" do
      visit '/'
      
      within("#navbar-search-field") do
        fill_in 'zipcode', with: '80203'
      end
      
      click_button 'Locate'
      expect(page).to have_content 'Stations'
    end
  end
end