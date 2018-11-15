# == Schema Information
#
# Table name: courses
#
#  id               :bigint(8)        not null, primary key
#  name             :string
#  promotion_id     :bigint(8)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  description      :text
#  teach_project_id :integer
#  starting_at      :date
#

class Course < ApplicationRecord
  belongs_to :promotion
  has_many :achievements
  has_many :events
  has_many :evaluations

  scope :done, -> { where('starting_at < ?', Date.today)}

  default_scope { order(:starting_at) }

  delegate :students, to: :promotion

  def name_with_promotion
    "#{promotion} / #{to_s}"
  end

  def average_note
    total = student_notes.reduce(0, :+)
    1.0 * total / promotion.students.count
  end

  def median_note
    student_notes.sort[student_notes.count/2]
  end

  def student_notes
    # TODO store notes in database somehow, this is so slow
    @student_notes ||= promotion.students.map { |student| student.note_for_course(self) }
  end

  def current?
    # TODO avant le cours suivant
    Date.today >= starting_at && Date.today < starting_at + 7.days
  end

  def done?
    Date.today > starting_at + 7.days
  end

  def to_s
    "#{name}"
  end
end
