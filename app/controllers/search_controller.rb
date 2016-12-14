class SearchController < ApplicationController
  def index
    @search_param = params[:zipcode]
  end
  
end