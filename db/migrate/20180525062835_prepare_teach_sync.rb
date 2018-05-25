class PrepareTeachSync < ActiveRecord::Migration[5.2]
  def change
    add_column :promotions, :year, :integer
    add_column :courses, :teach_project_id, :integer
  end
end
