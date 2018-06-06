class AddPluralsightDataToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :pluralsight_uuid, :string
    add_column :students, :pluralsight_data_completedcourses, :text
  end
end
