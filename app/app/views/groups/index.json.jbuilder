json.array!(@groups) do |group|
  json.extract! group, :id, :gname
  json.url group_url(group, format: :json)
end
