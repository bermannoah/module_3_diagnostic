require 'rails_helper'

describe 'a user searches for stations' do
  context 'a user enters a zipcode' do
    xscenario 'a user sees nearest stations' do
      visit '/'
      
      fill_in 'zipcode', with: '80203'
      
      click_button 'Locate'
      
      expect(page).to have_content 'Stations near 80203'
      expect(page).to have_content 'ChargePoint Network'
    end
  end
end