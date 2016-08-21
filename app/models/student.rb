# == Schema Information
#
# Table name: students
#
#  id                :integer          not null, primary key
#  firstname         :string(255)
#  lastname          :string(255)
#  codeschool        :string(255)
#  codecademy        :string(255)
#  promotion_id      :integer
#  created_at        :datetime
#  updated_at        :datetime
#  codeschool_data   :text
#  codecademy_data   :text
#  codecademy_badges :text
#

class Student < ActiveRecord::Base
  belongs_to :promotion

  validates :firstname, :lastname, :promotion_id, presence: true
  
  default_scope { order('lastname, firstname') }

  include Codeschool
  include Codecademy

  def sync!
    codecademy_sync!
    codeschool_sync!
  end

  def to_s
    "#{firstname} #{lastname}"
  end
end
