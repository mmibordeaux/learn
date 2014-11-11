module Codecademy
  extend ActiveSupport::Concern

  def codecademy_score
    codecademy_html.css('h3.padding-right--quarter')[0].text unless codecademy_data.nil?
  end

  def codecademy_skills
    codecademy_html.css('#completed h5') unless codecademy_data.nil?
  end

  # TODO rename the db field badges_data
  def codecademy_badges_list
    codecademy_badges_html.css('.achievements h5') unless codecademy_data.nil?
  end

  def codecademy_url
    "http://www.codecademy.com/fr/#{codecademy}"
  end

  def codecademy_html
    Nokogiri::HTML(codecademy_data) 
  end

  def codecademy_badges_url
    "http://www.codecademy.com/fr/users/#{codecademy}/achievements"
  end

  def codecademy_badges_html
    Nokogiri::HTML(self.codecademy_badges) # TODO codecademy_badges_data
  end

  def codecademy_sync!
    begin
      require 'open-uri'
      require 'json'
      self.codecademy_data = open(codecademy_url).read.html_safe
      self.codecademy_badges = open(codecademy_badges_url).read.html_safe
      self.save
    rescue
    end
  end
  
end