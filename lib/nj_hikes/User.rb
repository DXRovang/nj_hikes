require "pry"

class NjHikes::User

  attr_accessor :city

  def initialize(city)
    @city = city
  end

  def location
    Geocoder.search(self.city).first.coordinates
  end

end