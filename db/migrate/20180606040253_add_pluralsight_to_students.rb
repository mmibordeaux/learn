class AddPluralsightToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :pluralsight, :string
    add_column :students, :pluralsight_data, :text
  end
end
