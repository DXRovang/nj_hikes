require "pry"
require "nokogiri"
require "open-uri"

class NjHikes::Scraper 

  @@hike_list = []

  def hikes
    #scrape full site of hikes for individual websites
    site = "https://www.njhiking.com/nj-hikes/"
    page = Nokogiri::HTML(open(site))
    results = page.css("ul.fa-ul li")
    results.each do |r|
      @@hike_list << r.css("a").attr("href") 
      @@hike_list
    end

    def list_hikes
      @@hike_list.each.with_index(1) do |hike, index|
        puts "#{index + 1}. #{hike}"
      end
    end


  def hike_location
    self.hikes
    #iterate over individual websites for coordinates
    site = @@hike_list[0].value#[@index - 1]
    page = Nokogiri::HTML(open(site))
    r = page.css("h3 a")    
    r.text
    puts r.text
  end

end


# class NjHikes::Scraper 

#   @@hike_list = []
#   @@near_hikes = []

#   def hikes
#     #scrape full site of hikes for individual websites
#     site = "https://www.njhiking.com/nj-hikes/"
#     page = Nokogiri::HTML(open(site))
#     results = page.css("ul.fa-ul li")
#     results.each do |r|
#       key = r.css("a").attr("href").value
#       hash = { key => nil}
#       #use websites as keys to hashes in class array
#       @@hike_list << hash
#     end
#     @@hike_list
#   end

#   def hike_location
#     self.hikes
#     #iterate over individual websites for coordinates
#     @@hike_list.each do |hash|
#       hash.each do |key, value|
#         page = Nokogiri::HTML(open(key))
#         results = page.css("h3 a")
#         results.each do |r|
#           #add coordinates as values to hash
#           if r.text[1] != nil && r.text[1].match(/\d/)
#             hash[key] = r.text
#           else
#             hash[key] = nil
#           end
#         end 
#       end
#     end
#     @@hike_list
#   end

#   def near_hikes
#     self.hike_location
#     #check values for distance from User
#     @@hike_list.each do |hash|
#       hash.each do |key, value|
#         distance = Geocoder::Calculations.distance_between(40.9681536 -74.2957043, value)
#         if distance < 50
#           @@near_hikes << value
#         end
#       end
#     end 
#     @@near_hikes
#   end 
   
# end