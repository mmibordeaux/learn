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
#  course_id  :integer
#

class Achievement < ApplicationRecord

  belongs_to :course

  default_scope { order(:position) }

  def done_by?(student)
    points_by(student) > 0
  end

  def points_by(student)
    student.note_for_achievement self
  end

  def to_s
    "#{title}"
  end
end
