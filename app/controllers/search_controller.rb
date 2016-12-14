class SearchController < ApplicationController
  def index
    search_param = params[:zipcode]
    @stations_object = find_nearest_stations(search_param)
  end
  
  def find_nearest_stations(search_parameter)
    raw_response = StationService.new.stations(search_parameter)
    cleaned_response = JSON.parse(raw_response.body)
  end
  
end