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
#

require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
