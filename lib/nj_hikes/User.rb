class NjHikes::User

  attr_accessor :city, :saved_hikes

  @@saved_hikes = []

  def initialize(city)
    @city = city
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