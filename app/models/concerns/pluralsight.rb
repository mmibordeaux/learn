module Pluralsight
  require 'open-uri'
  extend ActiveSupport::Concern

  def pluralsight_validated?(title)
    return false if pluralsight_data.nil? or pluralsight_data.empty?
    pluralsight_data_completedcourses.include? title
  end

  def pluralsight_url
    "https://app.pluralsight.com/profile/#{pluralsight}" unless pluralsight.nil?
  end

  def pluralsight_sync!
    update_column :pluralsight_data, pluralsight_data
    update_column :pluralsight_uuid, pluralsight_uuid
    update_column :pluralsight_data_completedcourses, pluralsight_data_completedcourses
  rescue
  end

  protected

  def pluralsight_data
    URI.open(pluralsight_url).read
  rescue
  end

  def pluralsight_data_completedcourses
    URI.open(pluralsight_courses_url).read
  rescue
  end

  def pluralsight_courses_url
    "https://app.pluralsight.com/profile/data/completedcourses/#{pluralsight_uuid}"
  end

  def pluralsight_uuid
    pluralsight_payload['handle']
  end

  def pluralsight_payload
    encoded = pluralsight_data.split("window.detailsPayload = '").last.split("';").first
    decoded = Base64.decode64 encoded
    JSON.parse decoded
  rescue
    {}
  end
end
