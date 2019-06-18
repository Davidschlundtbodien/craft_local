json.array! @breweries.each do |brewery|
  json.partial! "brewery.json.jbuilder", brewery: brewery
end  