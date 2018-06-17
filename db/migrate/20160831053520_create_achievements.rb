class CreateAchievements < ActiveRecord::Migration[4.2]
  def change
    create_table :achievements do |t|
      t.string :title
      t.text :text
      t.integer :position
      t.integer :points
      t.string :identifier
      t.text :why
      t.text :how

      t.timestamps
    end
  end
end
