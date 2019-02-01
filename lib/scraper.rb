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
    sm = doc.css('.social-icon-container')
    # twitter = "https://twitter.com"
    # linkedin = "https://www.linkedin.com" // "https://www.linkedin.com"
    # github = "https://github.com" // "https://www.github.com"
    # blog = "https://twitter.com"
    quote = doc.css('.profile-quote')
    # bio = 
    binding.pry
    
    
  end

end

# Scraper.scrape_index_page("./fixtures/student-site/index.html")
Scraper.scrape_profile_page()