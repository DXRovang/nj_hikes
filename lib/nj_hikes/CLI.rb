
require "pry"

class NjHikes::CLI

  def call
      greeting
      search
  end

  def search
    get_user_input
    list_number
    hike = @scraper.hike_info(@choice)
    closer(hike)    
  end

  @@hiker = nil
  def self.hiker
    @@hiker
  end

  def greeting
    #instantiates Scraper & User
    puts "\nWelcome to NJ Hikes!  May I ask what city in NJ you're in?"
    city = gets.chomp
    @scraper = NjHikes::Scraper.new
    @@hiker = NjHikes::User.new(city)
  end

  def get_user_input
    puts "Brilliant!"
    puts "There are #{@scraper.class.all.count} hikes in the state of NJ."
    puts "These are the first 10."
    list_hikes
  end

  @@index = 0

  def list_hikes
    #lists ten hikes at a time
    10.times do
      puts "#{@@index + 1}. #{@scraper.class.all[@@index]}"
      @@index += 1
    end
    puts "Please enter the number of the hike you're interested in,"
    puts "or type 'next' to see the next 10."
    @number = gets.chomp.to_i
    if @number == 0
      list_hikes
    end
  end

  def list_number
    #returns the website of the number that was chosen
    @choice = @scraper.hikes[@number - 1]
  end

  def closer(hike)
    hike.info
    puts "Are you interested in looking at another hike?"
    puts "(y/n)"
    input = gets.chomp
    if input == "y"
      @@index = 0
      search
    else
      puts "Thank you for visiting NJ Hikes.  Enjoy your hike!"
    end
  end

end