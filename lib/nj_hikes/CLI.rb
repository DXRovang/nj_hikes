
class NjHikes::CLI

@@user_location = " "

  def call
    puts "Welcome!  Are you located in NJ? (y/n)"
    input = gets.chomp
    if input == "y"
      #create hike list via NjHikes::Scraper.new.hikes
      puts "Thank you!" 
      #use @@hike_list.count as a var in next line
      puts "There are 193 in the state of NJ.  How many would you like to examine at a time?"
      puts "(10/50/All)"
      input = gets.chomp
      case input
        when "10"
          puts "Here are the first 10 hikes:"
          full_hike_list
          #return 10 hikes
          #ask if they want to examine a single hike 
          #or see the next 10

          #if they choose a single hike, show hike info
          #ask if they would like to see the hike list again
          #end
        when "50"
          puts "Here are the first 50 hikes:"
          full_hike_list
        when "All"
          puts "Here are all of the hikes:"
          full_hike_list
        else
          puts "I'm sorry, I didn't understand your entry."
      end
    else
      puts "I'm sorry, this site only lists hikes in the state of NJ."
    end
  end

  def full_hike_list
    @hikes = ["one", "two", "three"]  #this will come from Scraper
    @hikes.each.with_index(1) {|hike, index| puts "#{index + 1}. #{hike}"}
  end

end