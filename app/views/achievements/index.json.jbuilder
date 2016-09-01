json.array!(@achievements) do |achievement|
  json.extract! achievement, :id, :title, :text, :position, :points, :identifier, :why, :how
  json.url achievement_url(achievement, format: :json)
end
