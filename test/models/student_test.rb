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
#  note              :float
#

require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
