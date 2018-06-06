class AddStartDateToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :starting_at, :date
  end
end
