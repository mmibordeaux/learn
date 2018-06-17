class CreateJoinTableEventsStudents < ActiveRecord::Migration[4.2]
  def change
    create_join_table :events, :students do |t|
      # t.index [:event_id, :student_id]
      # t.index [:student_id, :event_id]
    end
  end
end
