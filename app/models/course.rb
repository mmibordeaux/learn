# == Schema Information
#
# Table name: courses
#
#  id           :bigint(8)        not null, primary key
#  name         :string
#  promotion_id :bigint(8)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  description  :text
#

class Course < ApplicationRecord
  belongs_to :promotion
  has_many :achievements
  has_many :events

  def to_s
    "#{name}"
  end
end
