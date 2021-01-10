require_relative "./nj_hikes/version"
require_relative "./nj_hikes/CLI"
require_relative "./nj_hikes/User"
require_relative "./nj_hikes/Hike"
require_relative "./nj_hikes/Scraper"

require "nokogiri"
require "open-uri"
require "pry"
require "geocoder"
require "colorize"


module NjHikes
  class Error < StandardError; end
  # Your code goes here...
end
