class NjHikes::Hike 

  attr_accessor :length, :coordinates, :toilet, :website, :name, :proximity

  def initialize
  end

  def info
    puts "Here's some info about your hike!"
    puts "\n#{self.name}".colorize(:red)
    puts "Hike length:".colorize(:green) + " #{self.length}"
    puts "Distance from #{NjHikes::CLI.hiker.city}:".colorize(:green) + " #{self.proximity} miles."
    puts "Restroom facilities:".colorize(:green) + " #{self.toilet}"
    puts "Website:".colorize(:green) + " #{self.website}"
  end

  def proximity
    location = self.coordinates.split
    one = location[0].scan(/\d{2}[.]\d{5}/)
    two = location[1].scan(/\d{2}[.]\d{5}/)
    two_minus = (two.join.to_f * -1).to_s.split
    final_location = [one, two_minus].join(" ").split
    miles = Geocoder::Calculations.distance_between(NjHikes::CLI.hiker.location, final_location)
    miles.round
  end 

end

