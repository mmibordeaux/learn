# == Schema Information
#
# Table name: students
#
#  id                                :integer          not null, primary key
#  firstname                         :string(255)
#  lastname                          :string(255)
#  codeschool                        :string(255)
#  codecademy                        :string(255)
#  promotion_id                      :integer
#  created_at                        :datetime
#  updated_at                        :datetime
#  codeschool_data                   :text
#  codecademy_data                   :text
#  codecademy_badges                 :text
#  note                              :float
#  email                             :string(255)      default(""), not null
#  encrypted_password                :string(255)      default(""), not null
#  reset_password_token              :string(255)
#  reset_password_sent_at            :datetime
#  remember_created_at               :datetime
#  sign_in_count                     :integer          default(0), not null
#  current_sign_in_at                :datetime
#  last_sign_in_at                   :datetime
#  current_sign_in_ip                :string(255)
#  last_sign_in_ip                   :string(255)
#  github_identifier                 :string(255)
#  github_repository                 :string(255)
#  heroku_app                        :string(255)
#  admin                             :boolean          default(FALSE)
#  pluralsight                       :string
#  pluralsight_data                  :text
#  pluralsight_uuid                  :string
#  pluralsight_data_completedcourses :text
#

class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :omniauthable, :registerable, :trackable, :validatable
  devise :database_authenticatable, :recoverable, :rememberable
  belongs_to :promotion

  has_many :events
  has_many :evaluations

  validates_uniqueness_of :codeschool, :codecademy, :github_identifier, :heroku_app, allow_blank: true, allow_nil: true

  scope :admin, -> { where(admin: true) }

  default_scope { order('lastname, firstname') }


  include Gravtastic
  gravtastic size: 200

  include Codeschool
  include Codecademy
  include Pluralsight
  include Github
  include Heroku

  def sync_profile!
    codecademy_sync!
    codeschool_sync!
    pluralsight_sync!
  end

  def note_for_course(course)
    note = 0
    course.achievements.each do |achievement|
      note += achievement.points_earned_by self
    end
    note
  end

  def to_s
    "#{firstname} #{lastname}"
  end
end
