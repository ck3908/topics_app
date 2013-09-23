json.array!(@topics) do |topic|
  json.extract! topic, :title, :sector, :content, :made_by
  json.url topic_url(topic, format: :json)
end
