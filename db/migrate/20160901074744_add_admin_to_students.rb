class AddAdminToStudents < ActiveRecord::Migration[4.2]
  def change
    add_column :students, :admin, :boolean, default: false
  end
end
