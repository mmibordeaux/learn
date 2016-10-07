# == Schema Information
#
# Table name: promotions
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Promotion < ActiveRecord::Base
  has_many :students
  validates :name, presence: true
  has_and_belongs_to_many :events

  include Codeschool
  include Codecademy

  def average_note
    students.average(:note)
  end

  def to_s
    "#{name}"
  end
end
