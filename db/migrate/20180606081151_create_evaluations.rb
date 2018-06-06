class CreateEvaluations < ActiveRecord::Migration[5.2]
  def change
    create_table :evaluations do |t|
      t.text :comment
      t.text :relevant_content
      t.text :content_to_add
      t.text :content_to_remove
      t.integer :quality
      t.integer :technical_skills_acquired
      t.integer :soft_skills_acquired
      t.integer :knowledge_acquired
      t.references :student, foreign_key: true
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
