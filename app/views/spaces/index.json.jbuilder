json.array!(@spaces) do |space|
  json.extract! space, :id, :planet, :des
  json.url space_url(space, format: :json)
end
