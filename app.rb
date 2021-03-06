require './lib/scraper'
require './lib/student'
require 'launchy'

	my_scraper = Scraper.new("http://flatironschool-bk.herokuapp.com")
	@name = my_scraper.get_name_wo_regex
	@twitter_url = my_scraper.get_twitter
	@blog_url = my_scraper.get_blog


	@students = []

	28.times do |i|
		student = Student.new(@name[i], @twitter_url[i], @blog_url[i])
	  	@students << student
	end
	


def options
	puts "Type 'twitter' or 'blog' to launch in browser. Otherwise, type 'go back'"
	answer = gets.chomp
	case
		when answer == "twitter"
			Launchy.open("#{@twitter_url[@name_pick]}")
			directory
		when answer == "blog"
			Launchy.open("#{@blog_url[@name_pick]}")
			directory
		when answer == "go back"
			directory
	end
end

def directory

	puts "The Flatiron BK #001 Directory"
	puts "Type 'ls' to see a list of students; Type 'get lucky' to visit a random blog address"
	input = gets.chomp
	input.to_s


if input == "ls"
		28.times do |i|
			puts "#{i+1}. #{@students[i].name}"
		end
		puts "Pick a student? Enter number"
		@name_pick = gets.chomp
		@name_pick = @name_pick.to_i - 1
		puts "Name: #{@name[@name_pick]}"
		puts "Twitter: #{@blog_url[@name_pick]}"
		puts "Blog: #{@twitter_url[@name_pick]}"
		options

		if input == "get lucky" 
			Launchy.open("#{@blog_url.sample}")
		end
	end
end

directory
