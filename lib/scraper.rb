require 'open-uri'
require 'nokogiri'

class Scraper
	attr_reader :html

	def initialize(url)
		download = open(url)
		@html = Nokogiri::HTML(download)	
	end

	def get_twitter
		twitter_url = []
		student_html = html.search(".student")
		student_html.each do |twitter|
			if twitter.search(".twitter")[0].nil?
				twitter_url << "none"
			else
				twitter_url << twitter.search(".twitter")[0]["href"]
			end
			
		end
		twitter_url
	end 


#	def get_name
#		 html.search("h3").text.split(/(?<=[a-z.])(?=[A-Z])/)
#	end	


	def get_name_wo_regex
		html.search("h3").map do |name|
			name.text
		end
	end	

	def get_blog
		blog_url = []
		student_html = html.search(".student")
		student_html.each do |blog|
			if blog.search(".blog")[0].nil?
				blog_url << "none"
			else
				blog_url << blog.search(".blog")[0]["href"]
			end
		end
		blog_url
	end
end


