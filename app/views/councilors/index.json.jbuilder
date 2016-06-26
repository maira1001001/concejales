json.array!(@councilors) do |councilor|
  json.extract! councilor, :id
  json.url councilor_url(councilor, format: :json)
end
