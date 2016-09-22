module Github
  extend ActiveSupport::Concern

  def github_validated?(title)
    case title 
    when 'account_created'
      return false if github_identifier.nil? 
      return false if github_identifier.empty?
      # return false unless account_exists?
      true
    when 'rails_repository_created'
      return false if github_repository.nil? 
      return false if github_repository.empty?
      # return false unless repository_exists?
      # return false unless repository_is_ruby?
      true
    end
  end

  def github_identifier_url
    "https://github.com/#{github_identifier}" unless github_identifier.nil?
  end

  def github_repository_url
    "#{github_identifier_url}/#{github_repository}" unless github_repository.nil?
  end

  protected

  def account_exists?
    url_exists? github_identifier_url
  end

  def repository_exists?
    url_exists? github_repository_url
  end

  def url_exists?(url)
    begin
      open url
      return true
    rescue
      return false
    end
  end

  def repository_is_ruby?
    url = "https://api.github.com/repos/#{github_identifier}/#{github_repository}/languages"
    begin
      file = open url
    rescue
      return false
    end
    string = file.read
    hash = JSON.parse string
    hash.include? 'Ruby'
  end
end