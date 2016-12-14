class SearchController < ApplicationController
  def index
    @search_param = params[:zipcode]
  end
  
  def find_nearest_stations
    
    
  end
  
end