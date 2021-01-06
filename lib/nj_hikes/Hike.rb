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
    one = location[0].scan(/\d{2}[.]\d{5}/)
    two = location[1].scan(/\d{2}[.]\d{5}/)#needs to become negative
    final_location = [one, two].join(" ").split
    miles = Geocoder::Calculations.distance_between(NjHikes::CLI.hiker.location, final_location)
    miles.round
  end 

end
