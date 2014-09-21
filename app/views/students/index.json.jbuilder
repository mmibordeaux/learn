json.array!(@students) do |student|
  json.extract! student, :id, :firstname, :lastname, :codeschool, :codecademy, :promotion_id
  json.url student_url(student, format: :json)
end
