class LinkToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :course_id, :integer
    add_column :achievements, :course_id, :integer
  end
end
