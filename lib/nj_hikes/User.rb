class NjHikes::User

  attr_accessor :city, :saved_hikes, :cities

  @@saved_hikes = []
  @@cities = []

  def initialize

  end

  def self.cities
    @@cities
  end

  def location
    Geocoder.search(self.city).first.coordinates
  end

  def self.saved_hikes
    @@saved_hikes
  end

  def self.saved_hikes=(hike)
    @@saved_hikes << hike
  end

end