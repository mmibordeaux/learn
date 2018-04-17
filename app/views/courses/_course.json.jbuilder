json.extract! course, :id, :title, :promotion_id, :created_at, :updated_at
json.url course_url(course, format: :json)
