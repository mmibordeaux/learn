# == Schema Information
#
# Table name: courses
#
#  id           :integer          not null, primary key
#  name         :string
#  promotion_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  description  :text
#

class Course < ApplicationRecord
  belongs_to :promotion

  def to_s
    "#{name}"
  end
end
