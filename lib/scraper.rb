require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    all_students = []
    doc = Nokogiri::HTML(open(index_url))
    student_elements = doc.css('.student-card')
    student_elements.each do |student|
      student_hash = {}
      student_hash[:name] = student.css('.student-name').text
      student_hash[:location] = student.css('.student-location').text
      student_hash[:profile_url] = student.css('a').attr('href').text
      all_students << student_hash
    end
    all_students
  end

  def self.scrape_profile_page(profile_url)
    doc = Nokogiri::HTML(open("./fixtures/student-site/index.html" + profile_url))
    social_media = doc.css('.social-icon-container')
    twitter = "https://twitter.com"
    
    
  end

end

# Scraper.scrape_index_page("./fixtures/student-site/index.html")