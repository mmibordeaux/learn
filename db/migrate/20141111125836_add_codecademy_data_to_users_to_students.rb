class AddCodecademyDataToUsersToStudents < ActiveRecord::Migration
  def change
    add_column :students, :codecademy_data, :text
    add_column :students, :codecademy_badges, :text
  end
end
