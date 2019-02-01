require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    puts "hi"
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
    profile_hash = {}
    doc = Nokogiri::HTML(open("./fixtures/student-site/" + profile_url))
    profile_hash[:bio] = doc.css('.bio-content .description-holder').text
    profile_hash[:profile_quote] = doc.css('.profile-quote').text
    social_media = doc.css('.social-icon-container').css('a')
    social_media.each do |icon|
      if icon.attr('href')[8..17]
        github.com
        twitter.co
    doc.css('.social-icon-container').css('a')[0].attr('href')
    # twitter = "https://twitter.com"
    # linkedin = "https://www.linkedin.com" // "https://www.linkedin.com"
    # github = "https://github.com" // "https://www.github.com"
    # blog = "https://twitter.com"
    binding.pry
    
    
  end

end

# Scraper.scrape_index_page("./fixtures/student-site/index.html")
Scraper.scrape_profile_page("students/jenny-yamada.html")