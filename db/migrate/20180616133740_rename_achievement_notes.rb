class RenameAchievementNotes < ActiveRecord::Migration[5.2]
  def change
    rename_table :achievement_points, :achievement_notes
  end
end
