# == Schema Information
#
# Table name: evaluations
#
#  id                        :bigint(8)        not null, primary key
#  comment                   :text
#  relevant_content          :text
#  content_to_add            :text
#  content_to_remove         :text
#  quality                   :integer
#  technical_skills_acquired :integer
#  soft_skills_acquired      :integer
#  knowledge_acquired        :integer
#  student_id                :bigint(8)
#  course_id                 :bigint(8)
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#

class Evaluation < ApplicationRecord
  belongs_to :student
  belongs_to :course
end
