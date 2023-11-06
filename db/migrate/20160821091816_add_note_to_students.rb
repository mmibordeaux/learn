class AddNoteToStudents < ActiveRecord::Migration[4.2]
  def change
    add_column :students, :note, :float
  end
end
