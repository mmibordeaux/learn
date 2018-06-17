class CreatePromotions < ActiveRecord::Migration[4.2]
  def change
    create_table :promotions do |t|
      t.string :name

      t.timestamps
    end
  end
end
