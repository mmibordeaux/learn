class AddKindToAchievement < ActiveRecord::Migration[5.2]
  def change
    add_column :achievements, :kind, :string
  end
end
