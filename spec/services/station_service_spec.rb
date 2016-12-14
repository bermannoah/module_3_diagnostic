require 'rails_helper'

describe 'StationService' do
  context '#stations'do
    it 'returns nearest stations for a user', :vcr do
      zipcode = 80203
      stations = StationService.new(ENV['NREL_API_KEY']).stations(zipcode)
      
      expect(stations.count).to eq(10)
    end
  end
end