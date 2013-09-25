json.array!(@reviews) do |review|
  json.extract! review, :title, :author, :content, :rating, :topic_id
  json.url review_url(review, format: :json)
end
