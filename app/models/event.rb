# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  date        :date
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

class Event < ActiveRecord::Base
  has_and_belongs_to_many :promotions
  has_and_belongs_to_many :teachers, class_name: 'Student'

  def to_s
    "#{name}"
  end
end
