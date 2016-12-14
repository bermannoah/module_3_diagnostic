class StationsPresenter
  attr_reader :stations
  
  def initialize(stations)
    @stations = stations_parse(stations)
  end
  
  def stations_parse(stations)
    final = stations.each do |station|
      @name = station["station_name"]
      @address = station["street_address"] + "," + station["state"] + "," + station["zip"]
      @fuel_type = station["fuel_type_code"]
      @distance = station["distance"]
      @access_days_and_times = station["access_days_time"]
    end
  final
  end

end