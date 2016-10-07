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

require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
