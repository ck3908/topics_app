json.array!(@ideas) do |idea|
  json.extract! idea, :index, :show
  json.url idea_url(idea, format: :json)
end
