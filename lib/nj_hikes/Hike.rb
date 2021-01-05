


class NjHikes::Hike 

  attr_accessor :level, :distance, :restroom, :website, :quote

  def initialize
    @index = index
  end

  def all_hikes
    @@hike_list.each_with_index do |hike, index|
    puts "#{index + 1}. #{hike}"
  end

  def info

  end


end


