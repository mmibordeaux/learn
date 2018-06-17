class AddCodecademyDataToUsersToStudents < ActiveRecord::Migration[4.2]
  def change
    add_column :students, :codecademy_data, :text
    add_column :students, :codecademy_badges, :text
  end
end
