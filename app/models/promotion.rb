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

  include Codeschool
  include Codecademy

  def to_s
    "#{name}"
  end
end
