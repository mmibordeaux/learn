class AddCodeschoolDataToStudent < ActiveRecord::Migration
  def change
    add_column :students, :codeschool_data, :text
  end
end
