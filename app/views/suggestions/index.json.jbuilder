json.array!(@suggestions) do |suggestion|
  json.extract! suggestion, :id, :content, :name, :email
  json.url suggestion_url(suggestion, format: :json)
end
