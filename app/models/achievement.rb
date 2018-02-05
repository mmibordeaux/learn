# == Schema Information
#
# Table name: achievements
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  text       :text
#  position   :integer
#  points     :integer
#  identifier :string(255)
#  why        :text
#  how        :text
#  created_at :datetime
#  updated_at :datetime
#

class Achievement < ApplicationRecord

  default_scope { order(:position) }

  def done_by?(student)
    points_by(student) > 0
  end

  def points_by(student)
    student.note_for self
  end
end
