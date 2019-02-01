require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    all_students = []
    doc = Nokogiri::HTML(open(index_url))
    student_elements = doc.css('.student-card')
    student_elements.each do |student|
      student[:name] = student.css('.student-name').text
      student[:location] = student.css('.student-location').text
      student[:profile_url] = ""
    binding.pry
    #[{:name => "" :location => "", :profile_url => ""}, {}, {}]
  end

  def self.scrape_profile_page(profile_url)
    
  end

end

Scraper.scrape_index_page("./fixtures/student-site/index.html")