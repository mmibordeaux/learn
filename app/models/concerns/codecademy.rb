module Codecademy
  extend ActiveSupport::Concern

  def codecademy_badges
    codecademy_results['badges'] if codecademy_results?
  end

  def codecademy_score
    doc = Nokogiri::HTML(self.codecademy_data) 
    doc.css("h3.padding-right--quarter")[0].text
  end

  def codecademy_results?
    not codecademy_data.nil?
  end

  def codecademy_url
    "http://www.codecademy.com/fr/#{codecademy}"
  end

  def codecademy_badges_url
    "http://www.codecademy.com/fr/users/#{codecademy}/achievements"
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