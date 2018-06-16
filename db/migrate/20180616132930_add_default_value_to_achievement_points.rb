class AddDefaultValueToAchievementPoints < ActiveRecord::Migration[5.2]
  def change
    change_column :achievement_points, :value, :float, default: 0
  end
end
