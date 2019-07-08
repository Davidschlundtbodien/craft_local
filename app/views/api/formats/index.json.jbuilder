json.array! @formats.each do |format|
  json.id format.id
  json.name format.name
end