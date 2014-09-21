class Promotion < ActiveRecord::Base
	has_many :students

	def to_s
		"#{name}"
	end
end
