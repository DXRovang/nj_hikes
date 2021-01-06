require "pry"

class NjHikes::Hike 

  attr_accessor :length, :coordinates, :toilet, :website, :distance, :name, :proximity

  def initialize
  end

  def info
    puts "Here's some info about your hike!"
    puts "#{self.name}"
    puts "Hike length: #{self.length}"
    puts "Distance from #{NjHikes::CLI.hiker.city}: #{self.proximity} miles."
    puts "Toilet: #{self.toilet}"
    puts "Website: #{self.website}"
  end

  def proximity
    location = self.coordinates.split
    Geocoder::Calculations.distance_between(NjHikes::CLI.hiker.location, location)
  end 

end


