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
#  kind       :string
#

class Achievement < ApplicationRecord

  KIND_NOTE = 'note'
  KIND_GITHUB = 'github'
  KIND_HEROKU = 'heroku'
  KIND_CODECADEMY = 'codecademy'
  KIND_PLURALSIGHT = 'pluralsight'
  KINDS = [KIND_NOTE, KIND_GITHUB, KIND_HEROKU, KIND_CODECADEMY, KIND_PLURALSIGHT]

  has_many :notes
  belongs_to :course

  default_scope { order(:position) }

  def kind_note?
    kind == Achievement::KIND_NOTE
  end

  def done_by?(student)
    points_earned_by(student) > 0
  end

  def points_earned_by(student)
    case kind
    when KIND_NOTE
      note_for_student(student).value
    else
      if student.respond_to? identifier_command
        achievement_validated = student.send(identifier_command, identifier_title)
        achievement_validated ? points : 0
      else
        0
      end
    end
  end

  def note_for_student(student)
    notes.where(student: student).first_or_create
  end

  def to_s
    "#{title}"
  end

  protected

  def identifier_command
    "#{identifier_service}_validated?"
  end

  def identifier_service
    identifier.split('://').first
  end

  def identifier_title
    identifier.split('://').last
  end

end
