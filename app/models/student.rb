class Student < ActiveRecord::Base
	belongs_to :promotion

	def to_s
		"#{firstname} #{lastname}"
	end

	def codeschool_badges
		codeschool_results['badges'] unless codeschool_results.nil?
	end

	def codeschool_score
		codeschool_results['user']['total_score'] unless codeschool_results.nil?
	end

	def codeschool_results?
		not codeschool_results.nil?
	end

	def codeschool_results
		require 'open-uri'
		require 'json'
		begin
			@codeschool_results ||= JSON.parse(open(codeschool_json_url).read)
		rescue
		end
	end

	def codeschool_url
		"https://www.codeschool.com/users/#{codeschool}"
	end

	def codeschool_json_url
		"#{codeschool_url}.json"
	end
end
