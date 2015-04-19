json.array!(@free_times) do |free_time|
  json.extract! free_time, :id, :user_id, :day, :timeSlot
  json.url free_time_url(free_time, format: :json)
end
