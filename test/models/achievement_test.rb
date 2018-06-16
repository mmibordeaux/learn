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

require 'test_helper'

class AchievementTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
