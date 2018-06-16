# == Schema Information
#
# Table name: achievement_notes
#
#  id             :bigint(8)        not null, primary key
#  achievement_id :bigint(8)
#  student_id     :bigint(8)
#  value          :float            default(0.0)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Achievement::Note < ApplicationRecord
  belongs_to :achievement
  belongs_to :student
end
