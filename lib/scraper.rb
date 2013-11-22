require 'open-uri'
require 'nokogiri'

class Scraper
	attr_reader :html

	def initialize(url)
		download = open(url)
		@html = Nokogiri::HTML(download)	
	end

	def get_twitter
		html.css('.twitter').text.split

	end

	def get_link
		html.css('.blog').map {|link| link["href"]}

	end

	def get_name
		html.search("h3").text.split(/(?<=[a-z.])(?=[A-Z])/)
	end	

end

#my_scraper = Scraper.new("http://flatironschool-bk.herokuapp.com/")
#puts my_scraper.get_twitter	
#puts my_scraper.get_link
#puts my_scraper.get_name

