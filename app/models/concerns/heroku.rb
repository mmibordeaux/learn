module Heroku
  extend ActiveSupport::Concern

  def heroku_validated?(title)
    if title == 'app_created'
      # TODO check if it runs, check if it is a Rails app
      !heroku_app.nil? and !heroku_app.empty?
    end
  end
end