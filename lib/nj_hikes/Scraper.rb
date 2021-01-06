require "pry"
require "nokogiri"
require "open-uri"

class NjHikes::Scraper 

  @@hike_list = []

  def initialize
    self.hikes
  end

  def self.all
    @@hike_list
  end

  def hikes
    #scrape full site of hikes for individual websites
    site = "https://www.njhiking.com/nj-hikes/"
    page = Nokogiri::HTML(open(site))
    results = page.css("ul.fa-ul li")
    results.each do |r|
      @@hike_list << r.css("a").attr("href").value 
    end
    @@hike_list
  end

  def hike_info(choice)
    #instantiates Hike & gives it attributes
    @new_hike = NjHikes::Hike.new
    site = choice
    page = Nokogiri::HTML(open(site))

    results = page.css("h1.entry-title").text
    @new_hike.name = results

    results1 = page.css("h3 a")
    results1.each do |r|
      if r.text[1] != nil && r.text[1].match(/\d/)
        @new_hike.coordinates = r.text
      end
    end

    results2 = page.css("p")
    results2.each do |r|
      if r.text.downcase.include?("miles")
        @new_hike.length = r.text
      elsif r.text.downcase.include?("toilet")
        @new_hike.toilet = r.text
      end
    end
    @new_hike.website = site
    @new_hike
  end


end