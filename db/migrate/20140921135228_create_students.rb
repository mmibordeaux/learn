class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :firstname
      t.string :lastname
      t.string :codeschool
      t.string :codecademy
      t.integer :promotion_id

      t.timestamps
    end
  end
end
