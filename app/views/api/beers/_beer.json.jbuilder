json.id beer.id
json.name beer.name
json.style beer.style
json.abv beer.abv
json.ibu beer.ibu
json.srm beer.srm
json.description beer.description
json.glassware beer.glassware
json.image beer.image
json.brewery beer.brewery.name
json.last_updated beer.last_updated
json.released beer.released

json.events beer.events.each do |event|
  json.id event.id
  json.title event.title
  json.image event.image
end  

json.formats beer.formats.each do |format|
  json.id format.id
  json.name format.name
  json.unit_type format.unit_type
  json.single_unit_volume format.single_unit_volume
  json.pack format.pack
  json.case format.case
end