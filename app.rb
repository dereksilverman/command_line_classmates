require './lib/scraper'
require './lib/student'

my_scraper = Scraper.new("http://flatironschool-bk.herokuapp.com")
name = my_scraper.get_name
twitter = my_scraper.get_twitter
blog = my_scraper.get_link

students = []

28.times do |i|
	student = Student.new(name[i], twitter[i], blog[i])
  	students << student
  end

