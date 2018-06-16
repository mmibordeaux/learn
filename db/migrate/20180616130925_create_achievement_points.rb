class CreateAchievementPoints < ActiveRecord::Migration[5.2]
  def change
    create_table :achievement_points do |t|
      t.references :achievement, foreign_key: true
      t.references :student, foreign_key: true
      t.float :value

      t.timestamps
    end
  end
end
