class AddCodeschoolDataToStudent < ActiveRecord::Migration[4.2]
  def change
    add_column :students, :codeschool_data, :text
  end
end
