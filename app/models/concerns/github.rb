module Github
  extend ActiveSupport::Concern

  def github_validated?(title)
    case title 
    when 'account_created'
      # TODO check if exists
      !github_identifier.nil? and !github_identifier.empty?
    when 'rails_repository_created'
      # TODO check if exists, and is Ruby app
      !github_repository.nil? and !github_repository.empty?
    end
  end
end