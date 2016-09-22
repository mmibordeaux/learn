module Heroku
  extend ActiveSupport::Concern

  def heroku_validated?(title)
    if title == 'app_created'
      return false if heroku_app.nil? 
      return false if heroku_app.empty?
      return false unless app_runs?
      return false unless app_is_rails?
      true
    end
  end

  def heroku_app_url
    "https://#{heroku_app}.herokuapp.com"
  end

  protected

  def app_runs?
  	# TODO
  	true
  end

  def app_is_rails?
  	# TODO
  	true
  end
end