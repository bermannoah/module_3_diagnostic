require 'rails_helper'

describe 'a user searches for stations' do
  context 'a user enters a zipcode' do
    scenario 'a user sees nearest stations', :vcr do
      visit '/'
      
      fill_in 'zipcode', with: '80203'
      
      click_button 'Locate'
      
      expect(page).to have_content 'Stations near 80203'
      expect(page).to have_content 'UDR'
      expect(page).to have_content '800 Acoma St, CO, 80204'
      expect(page).to have_content 'ELEC'
      expect(page).to have_content '0.3117'
      expect(page).to have_content '24 hours daily'
    end
  end
end