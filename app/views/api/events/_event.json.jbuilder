json.id event.id
json.title event.title
json.scheduled_date event.date
json.location event.location
json.content event.content
json.image event.image
json.brewery_host event.brewery.name
json.brewery_id event.brewery.id

json.beers event.beers.each do |beer|
  json.id beer.id
  json.name beer.name
  json.style beer.style
  json.abv beer.abv
  json.image beer.image
  json.brewery beer.brewery.name
end
