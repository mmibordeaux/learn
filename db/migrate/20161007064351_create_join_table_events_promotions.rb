class CreateJoinTableEventsPromotions < ActiveRecord::Migration[4.2]
  def change
    create_join_table :events, :promotions do |t|
      # t.index [:event_id, :promotion_id]
      # t.index [:promotion_id, :event_id]
    end
  end
end
