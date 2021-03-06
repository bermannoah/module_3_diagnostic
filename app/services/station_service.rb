class StationService
  def initialize
    nrel_api_key = ENV['NREL_API_KEY']
    @conn = Faraday.new(:url => 'https://developer.nrel.gov') do |faraday|
      faraday.request :url_encoded
      faraday.adapter Faraday.default_adapter
      faraday.params['api_key'] = nrel_api_key
    end
  end
  
  def stations(zipcode)
    @conn.get do |req|
      req.url '/api/alt-fuel-stations/v1/nearest.json?'
      req.params['location'] = zipcode
      req.params['radius'] = 6.0
      req.params['fuel_type'] = "ELEC,LPG"
      req.params['limit'] = 10
    end
  end  
end