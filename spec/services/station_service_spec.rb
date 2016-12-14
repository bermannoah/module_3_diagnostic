require 'rails_helper'

describe 'StationService' do
  context '#stations'do
    it 'returns nearest stations for a user', :vcr do
      zipcode = 80203
      stations = StationService.new(ENV['NREL_API_KEY']).stations(zipcode)
      results = JSON.parse(stations.body)
      
      expect(results.count).to eq(8)
    end
    
    
  end
end