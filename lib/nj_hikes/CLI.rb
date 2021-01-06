
class NjHikes::CLI

  def call
      greeting
      get_user_input
      list_number
      hike_info
  end

  def greeting
    puts "\nWelcome!  Are you located in NJ? (y/n)"
    input = gets.chomp
    if input == "y"
      @scraper = NjHikes::Scraper.new
      puts "Thank you!" 
    else
      puts "I'm sorry, this site only lists hikes in the state of NJ."
      #exit the program
    end
  end

  def get_user_input
    puts "There are #{@scraper.class.all.count + 1} hikes in the state of NJ." 
    puts "Which one are you interested in?"
    #this lists all hikes and gives them a number
    @scraper.list_hikes
    @list_number = gets.chomp.to_i
  end

  # def list_hikes
  #   @@hike_list.each.with_index(1) do |hike, index|
  #     puts "#{index + 1}. #{hike}"
  #   end
  # end

  def list_number
    #this returns the website of the number that was chosen
    @choice = @scraper.hikes[@list_number - 1]
  end

  def hike_info
    site = @scraper.hikes[@list_number - 1]
    page = Nokogiri::HTML(open(site))
    results = page.css("h3")
    #currently returns all h3.text from site
    #need to divvy it up in Hike class
    puts results.text
  end

end






  # def get_all
  #   puts "Here are all of the hikes:"
  #   @scraper.list_hikes
  #   puts "Would you like to examine a single hike?"
  #   puts "(hike number or n)"
  # end

  # def full_hike_list
  #   @scraper.list_hikes
  # end
# ------------

# class NjHikes::CLI

#   def call
#       greeting
#       get_user_input
#       list_amount
#   end

#   def greeting
#     puts "\nWelcome!  Are you located in NJ? (y/n)"
#     input = gets.chomp
#     if input == "y"
#       @scraper = NjHikes::Scraper.new
#       puts "Thank you!" 
#     else
#       puts "I'm sorry, this site only lists hikes in the state of NJ."
#       #exit the program
#     end
#   end

#   def get_user_input
#     puts "There are #{@scraper.class.all.count + 1} hikes in the state of NJ.  How many would you like to examine at a time?"
#     puts "(10/50/All)"
#     @list_amount = gets.chomp
#   end

#   def list_amount
#     case @list_amount
#     # when "10"
#     #   get_ten
#     # when "50"
#     #   get_fifty
#     when "All"
#       get_all
#     else
#       puts "I'm sorry, I didn't understand your entry."
#       get_user_input
#       list_amount
#     end
#   end

#   def get_single_hike

#   end

#   def get_ten
#     puts "Here are the first 10 hikes:"
#     ten = []
#     @scraper.class.all.each_slice(10) do |group|
#       ten << group
#     end

#     ten[0].each.with_index(1) do |hike, index|
#       puts "#{index}. #{hike}"
#     end

#     puts "Would you like to examine a single hike, or examine the next 10?"
#     puts "(hike number or next)"
#     input = gets.chomp

#     count = 1
#     if input == "next"
#       ten[count].each_with_index do |hike, index|
#         puts "#{index + 1}. #{hike}"
#         count+=1
#       end
#     elsif input == #<1-10>
#       #show hike info
#     end
#   end


#   def get_fifty
#     puts "Here are the first 50 hikes:"
#     fifty = @scraper.class.all
#     fifty.take(50).each.with_index(1) do |hike, index|
#       puts "#{index}. #{hike}"
#     end
#     puts "Would you like to examine a single hike, or examine the next 50?"
#     puts "(hike number or next)"
#     input = gets.chomp
#     if input == "1"
#       puts "Great! Here's some info about your hike." 
#       # get_single_hike
#     elsif input == "next"
#       puts "OK"
#     else
#       puts "I'm sorry, I didn't understand."
#     end
#   end

#   def get_all
#     puts "Here are all of the hikes:"
#     @scraper.list_hikes
#     puts "Would you like to examine a single hike?"
#     puts "(hike number or n)"
#   end

#   def num_to_hike(num)

#   end

#   def full_hike_list
#     @scraper.list_hikes
#   end

# end