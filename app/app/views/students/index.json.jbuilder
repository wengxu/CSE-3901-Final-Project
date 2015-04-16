json.array!(@students) do |student|
  json.extract! student, :id, :name, :major, :rank
  json.url student_url(student, format: :json)
end
