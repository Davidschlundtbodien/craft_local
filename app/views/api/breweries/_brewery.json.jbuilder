json.id brewery.id
json.name brewery.name
json.email brewery.email
json.profile_img brewery.profile_img
json.address brewery.address
json.longitude brewery.longitude
json.latitude brewery.latitude

json.beers brewery.beers.each do |beer|
  json.id beer.id
  json.name beer.name
  json.style beer.style
  json.abv beer.abv
  json.image beer.image
  json.released beer.released
  json.formats beer.formats
end

json.events brewery.events.each do |event|
  json.id event.id
  json.title event.title
  json.image event.image
  json.date event.date
  json.location event.location
end