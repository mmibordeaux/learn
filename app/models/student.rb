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

class Student < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :promotion

  # validates :firstname, :lastname, :promotion_id, presence: true
  
  default_scope { order('lastname, firstname') }

  include Codeschool
  include Codecademy

  def sync!
    codecademy_sync!
    codeschool_sync!
    check_repository
  end

  def note_for(identifier)
    0
  end

  def check_repository
    username = 'fivethirtyeight'
    repository = 'data'
    url = "https://api.github.com/repos/#{username}/#{repository}/languages"
    string = open(url).read
    hash = JSON.parse string
    valid = hash.include? 'Ruby'
  end

  def to_s
    "#{firstname} #{lastname}"
  end
end
