# == Schema Information
#
# Table name: achievement_points
#
#  id             :bigint(8)        not null, primary key
#  achievement_id :bigint(8)
#  student_id     :bigint(8)
#  value          :float            default(0.0)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class Achievement::PointTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
