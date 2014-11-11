module Codeschool
  extend ActiveSupport::Concern

  def codeschool_badges
    codeschool_results['badges'] if codeschool_results?
  end

  def codeschool_score
    codeschool_results['user']['total_score'] if codeschool_results?
  end

  def codeschool_results?
    not codeschool_results.nil?
  end

  def codeschool_results
    @codeschool_results ||= JSON.parse(codeschool_data) unless codeschool_data.nil?
  end

  def codeschool_url
    "https://www.codeschool.com/users/#{codeschool}"
  end

  def codeschool_json_url
    "#{codeschool_url}.json"
  end

  def codeschool_sync!
    begin
      require 'open-uri'
      require 'json'
      self.codeschool_data = open(codeschool_json_url).read
      self.save
    rescue
    end
  end
  
end