require 'rails_helper'

describe 'StationService' do
  context '#stations'do
    it 'returns nearest stations for a user', :vcr do
      zipcode = 80203
      stations = StationService.new(ENV['NREL_API_KEY']).stations(zipcode)
      results = JSON.parse(stations.body)
      
      expect(results.count).to eq(8)
    end
    
    it 'returns nearest stations for a user with a different zip code', :vcr do
      zipcode_1 = 63108
      stations_1 = StationService.new(ENV['NREL_API_KEY']).stations(zipcode_1)
      results_1 = JSON.parse(stations_1.body)
      
      zipcode_2 = 80203
      stations_2 = StationService.new(ENV['NREL_API_KEY']).stations(zipcode_2)
      results_2 = JSON.parse(stations_2.body)

      expect(results_2.count).to eq(8)
      expect(results_2["latitude"]).to_not eq(results_1["latitude"])
    end
  end
end