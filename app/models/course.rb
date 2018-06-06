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

  default_scope { order(:starting_at) }

  delegate :students, to: :promotion

  def name_with_promotion
    "#{promotion} / #{to_s}"
  end

  def current?
    Date.today >= starting_at && Date.today < starting_at + 7.days
  end

  def done?
    Date.today > starting_at + 7.days
  end

  def to_s
    "#{name}"
  end
end
