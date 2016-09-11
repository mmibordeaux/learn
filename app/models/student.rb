# == Schema Information
#
# Table name: students
#
#  id                     :integer          not null, primary key
#  firstname              :string(255)
#  lastname               :string(255)
#  codeschool             :string(255)
#  codecademy             :string(255)
#  promotion_id           :integer
#  created_at             :datetime
#  updated_at             :datetime
#  codeschool_data        :text
#  codecademy_data        :text
#  codecademy_badges      :text
#  note                   :float
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  github_identifier      :string(255)
#  github_repository      :string(255)
#  heroku_app             :string(255)
#  admin                  :boolean          default(FALSE)
#

class Student < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :promotion

  # validates_uniqueness_of :codeschool, :codecademy, :github_identifier, :heroku_app

  after_save :sync!

  default_scope { order('lastname, firstname') }

  include Codeschool
  include Codecademy
  include Github
  include Heroku

  def sync!
    codecademy_sync!
    codeschool_sync!
    compute_note
  end

  # def admin
  #   false
  # end

  def compute_note
    note = 0
    Achievement.all.each do |achievement|
      note += note_for achievement
    end
    self.update_column :note, note
  end

  def note_for(achievement)
    service, title = achievement.identifier.split('://')
    command = "#{service}_validated?"
    if respond_to? command
      send(command, title) ? achievement.points : 0
    else
      0
    end
  end

  def to_s
    "#{firstname} #{lastname}"
  end
end
