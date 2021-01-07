
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
    puts "\nWelcome!  Are you located in NJ? (y/n)"
    input = gets.chomp
    if input == "y"
      @scraper = NjHikes::Scraper.new

      puts "May I ask what city you're in?" 
      city = gets.chomp
      @@hiker = NjHikes::User.new(city)
    else
      puts "I'm sorry, this site only lists hikes in the state of NJ."
    end
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
      binding.pry
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
    end
  end

end