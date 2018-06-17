class AddGithubFieldsToStudents < ActiveRecord::Migration[4.2]
  def change
    add_column :students, :github_identifier, :string
    add_column :students, :github_repository, :string
    add_column :students, :heroku_app, :string
  end
end
