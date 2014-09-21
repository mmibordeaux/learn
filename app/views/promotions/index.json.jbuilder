json.array!(@promotions) do |promotion|
  json.extract! promotion, :id, :name
  json.url promotion_url(promotion, format: :json)
end
