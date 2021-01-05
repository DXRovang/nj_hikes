
class NjHikes::CLI

@@user_location = " "

  def call
    puts "\nWelcome!  Are you located in NJ? (y/n)"
    input = gets.chomp
    if input == "y"
      #create hike list via NjHikes::Scraper.new.hikes
      puts "Thank you!" 
      #use @@hike_list.count as a var in next line
      get_user_input
      list_amount
    else
      puts "I'm sorry, this site only lists hikes in the state of NJ."
    end
  end

  def full_hike_list
    @hikes = ["one", "two", "three"]  #this will come from Scraper
    @hikes.each.with_index(1) {|hike, index| puts "#{index + 1}. #{hike}"}
  end

  def get_user_input
    puts "There are 193 hikes in the state of NJ.  How many would you like to examine at a time?"
    puts "(10/50/All)"
    @list_amount = gets.chomp
  end

  def list_amount
    case @list_amount
    when "10"
      puts "Here are the first 10 hikes:"
      full_hike_list #return appropriate number
      puts "Would you like to examine a single hike, or examine the next 10?"
      puts "(hike number or next)"
      #if they choose a single hike, show hike info
      #ask if they would like to see the hike list again
      #end
    when "50"
      puts "Here are the first 50 hikes:"
      full_hike_list #return appropriate number
      puts "Would you like to examine a single hike, or examine the next 50?"
      puts "(hike number or next)"
    when "All"
      puts "Here are all of the hikes:"
      full_hike_list #return appropriate number
      puts "Would you like to examine a single hike?"
      puts "(hike number or n)"
    else
      puts "I'm sorry, I didn't understand your entry."
      get_user_input
      list_amount
    end
  end

  def get_single_hike

  end

end