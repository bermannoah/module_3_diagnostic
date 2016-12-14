require 'rails_helper'

describe "user visits the page" do
  context "a user visits root" do
    scenario "they see a search form" do
      visit '/'

      expect(page).to have_field('navbar-search-field') 
    end
  end
end