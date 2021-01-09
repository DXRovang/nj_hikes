class NjHikes::CLI

  def call
      greeting
      get_user_input
      search
  end

  def search
    list_hikes
    list_number
    user_hike
    closer(user_hike)    
  end

  @@hiker = nil
  def self.hiker
    @@hiker
  end

  def greeting
    #instantiates Scraper & User
    puts "\nWelcome to NJ Hikes!  May I ask what city in NJ you're in?".colorize(:yellow)
    city = gets.chomp
    @scraper = NjHikes::Scraper.new
    @@hiker = NjHikes::User.new(city)
  end

  def get_user_input
    puts "\nBrilliant!".colorize(:yellow)
    puts "There are #{@scraper.class.all.count} hikes in the state of NJ.".colorize(:yellow)
    puts "\nThese are the first 10.".colorize(:yellow)
  end

  @@index = 0

  def list_hikes
    #lists ten hikes at a time
    this_hike = @scraper.class.all
    10.times do
      length = this_hike[@@index].length - 2
      #fixes the formatting, originally a website
      hike = this_hike[@@index][25..length].split("-").map(&:capitalize).join(' ')
      puts "#{@@index + 1}. #{hike}"
      @@index += 1
    end
    puts "\nPlease enter the number of the hike you're interested in,".colorize(:yellow)
    puts "or type 'next' to see the next 10.".colorize(:yellow)
    @number = gets.chomp.to_i
    if @number == 0
      list_hikes
    end
  end

  def list_number
    #returns the website of the number that was chosen
    @choice = @scraper.hikes[@number - 1]
    #saves hike for future use
    @@hiker.class.saved_hikes << @choice
  end

  def user_hike
    @scraper.hike_info(@choice)
  end

  def closer(hike)
    hike.info
    puts "\nAre you interested in looking at another hike?".colorize(:yellow)
    puts "(y/n)"
    input = gets.chomp
    if input == "y"
      @@index = 0
      search
    elsif input == "n"
      puts "Would you like to see a list of the hikes you've already seen?".colorize(:yellow)
      puts "(y/n)"
      input = gets.chomp
      if input == "y"
        @@hiker.class.saved_hikes.each do |hike|
          puts "#{hike}".colorize(:blue)
        end
        puts "\nThank you for visiting NJ Hikes.  Enjoy your hike!".colorize(:yellow)
      else
        puts "\nThank you for visiting NJ Hikes.  Enjoy your hike!".colorize(:yellow)
      end 
    end
  end

end